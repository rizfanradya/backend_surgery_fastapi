from collections import defaultdict
from fastapi import APIRouter, Depends, UploadFile, File, Form
from fastapi.responses import StreamingResponse
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from utils.parse_date import parse_date
from utils.add_duration import add_duration
from utils.calculate_week_name import calculate_week_name
from datetime import date, datetime, time, timedelta
from calendar import monthrange
from openpyxl import load_workbook, Workbook
from pandas import DataFrame
from io import BytesIO
import json
from sqlalchemy import func, cast, String, extract
from typing import Optional, Literal
from schemas.schedule_results import ScheduleResultsSchema
from schemas.generate_daily_schedule import ScheduleResourceSchema
from models.masterplan import Masterplan
from models.schedule_results import ScheduleResults
from models.ot import Ot
from models.unit import Unit
from models.procedure_name import ProcedureName
from models.schedule_resource import ScheduleResource
from models.week import Week
from models.day import Day
from models.status import Status
from models.month import Month
from models.ot_assignment import OtAssignment

router = APIRouter()


@router.get('/result')
def schedule_results_and_filter(
    type: Literal['daily', 'weekly', 'monthly'] = 'daily',
    surgery_date: Optional[date] = None,
    week_id: Optional[int] = None,
    month_id: Optional[int] = None,
    year: Optional[int] = None,
    ot_id: Optional[int] = None,
    unit_id: Optional[str] = None,
    surgeon_name: Optional[str] = None,
    patient_name: Optional[str] = None,
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    try:
        current_today = datetime.today()
        min_year, max_year = session.query(
            func.min(extract('year', ScheduleResults.surgery_date)
                     ).label('min_year'),
            func.max(extract('year', ScheduleResults.surgery_date)
                     ).label('max_year')
        ).first()

        all_months = []
        all_weeks = []
        if min_year and max_year:
            all_months.extend({
                "name": f"{datetime(year, month, 1).strftime('%B')} {year}",
                "month_id": month,
                "year": year
            }
                for year in range(int(min_year), int(max_year) + 1)
                for month in range(1, 13)
            )

            for month in range(1, 13):
                for year in range(int(min_year), int(max_year) + 1):
                    start_date = datetime(year, month, 1)
                    _, days_in_month = monthrange(year, month)
                    end_date = datetime(year, month, days_in_month)
                    current_date = start_date
                    while current_date <= end_date:
                        if current_date.weekday() == 0:
                            week_number = (
                                current_date - start_date).days // 7 + 1
                            week_end = current_date + timedelta(days=4)
                            if week_end.month != current_date.month:
                                week_end = current_date + timedelta(days=4)
                            all_weeks.append({
                                "name": f"{current_date.strftime('%d %b')} - {week_end.strftime('%d %b %Y')}",
                                "fmt_name": f"Week {week_number}: {current_date.strftime('%d %b')} - {week_end.strftime('%d %b %Y')}",
                                "week_id": week_number,
                                "month_id": current_date.month,
                                "start_date": current_date,
                                "end_date": week_end
                            })
                        current_date += timedelta(days=1)

        schedule_results = session.query(
            ScheduleResults,
            Unit.name.label('unit_name'),
            Unit.color_hex.label('unit_color')
        ).join(
            Unit, Unit.id == ScheduleResults.unit_id
        )

        if type == 'daily':
            schedule_results = schedule_results.where(
                ScheduleResults.surgery_date == (surgery_date if surgery_date else date.today()))
        if type == 'weekly':
            if week_id and month_id:
                schedule_results = schedule_results.where(
                    ScheduleResults.week_id == week_id, ScheduleResults.month_id == month_id)
            else:
                current_week_id = (
                    current_today - datetime(current_today.year, current_today.month, 1)).days // 7 + 1
                if current_today.weekday() in [5, 6]:
                    current_week_id += 1
                schedule_results = schedule_results.where(
                    ScheduleResults.week_id == current_week_id,
                    ScheduleResults.month_id == current_today.month)
        if type == 'monthly':
            if month_id and year:
                schedule_results = schedule_results.where(
                    ScheduleResults.month_id == month_id,
                    extract('year', ScheduleResults.surgery_date) == year)
            else:
                schedule_results = schedule_results.where(
                    ScheduleResults.month_id == current_today.month,
                    extract('year', ScheduleResults.surgery_date) == current_today.year)
        if ot_id:
            schedule_results = schedule_results.where(
                ScheduleResults.ot_id == ot_id)
        if unit_id:
            schedule_results = schedule_results.where(
                ScheduleResults.unit_id == unit_id)
        if patient_name:
            schedule_results = schedule_results.where(
                cast(ScheduleResults.booked_by, String).ilike(f'%{patient_name}%'))
        if surgeon_name:
            schedule_results = schedule_results.where(
                ScheduleResults.surgeon_name == surgeon_name)

        surgeon_name_list = [
            result.surgeon_name for result, *_ in schedule_results.distinct(
                ScheduleResults.surgeon_name).all()
        ]

        total_data = schedule_results.count()
        schedule_results = schedule_results.all()
        ot_data = session.query(Ot).order_by(Ot.id.asc()).all()

        ot_data_count = {}
        for result, _, _ in schedule_results:
            ot_data_count[result.ot_id] = ot_data_count.get(
                result.ot_id, 0) + 1

        for ot in ot_data:
            count = ot_data_count.get(ot.id, 0)
            ot.category = f"OT {ot.id}\n{count} Surgeries"

        week_date_map = {
            (week['week_id'], week['month_id']): week['fmt_name']
            for week in all_weeks
        }
        month_year_map = {
            (month['year'], month['month_id']): month['name']
            for month in all_months
        }
        fmt_week_date_map = {
            (week['week_id'], week['month_id']): week['name']
            for week in all_weeks
        }

        if type == 'daily':
            formatted_results = []
            for result, unit_name, unit_color in schedule_results:
                get_odc = ot_data_count.get(result.ot_id, 0)
                result.category = f"OT {result.ot_id}\n{get_odc} Surgeries"
                result.surgeries = get_odc
                result.task = f"MRN-{result.mrn}"
                result.color = unit_color
                result.unit_name = unit_name
                formatted_results.append(result)
        else:
            schedule_by_week = defaultdict(list)
            surgeries_count = defaultdict(int)
            for result, _, _ in schedule_results:
                key = (result.week_id, result.day_id, result.ot_id)
                surgeries_count[key] += 1
            for result, unit_name, unit_color in schedule_results:
                key = (result.week_id, result.day_id, result.ot_id)
                year_info = result.surgery_date.year
                result.surgeries = surgeries_count[key]
                result.category = f"OT {result.ot_id}\n{
                    result.surgeries} Surgeries"
                result.task = f"MRN-{result.mrn}"
                result.color = unit_color
                result.unit_name = unit_name
                schedule_by_week[(result.week_id, result.month_id, year_info)].append(
                    result)
            formatted_results = [
                {
                    "week": week_date_map.get((week, month), f"Week {week}"),
                    "fmt_week": fmt_week_date_map.get((week, month), f"Week {week}"),
                    "month": month_year_map.get((year_info, month), f"{month} {year_info}"),
                    "data": data
                }
                for (week, month, year_info), data in schedule_by_week.items()
            ]

        return {
            "total": total_data,
            "all_months": all_months,
            "all_weeks": all_weeks,
            "all_days": session.query(Day).order_by(Day.id.asc()).all(),
            "all_ots": session.query(Ot).order_by(Ot.id.asc()).all(),
            "units": session.query(Unit).order_by(Unit.id.asc()).all(),
            "surgeon_name_list": surgeon_name_list,
            "schedule": formatted_results,
        }
    except Exception as error:
        send_error_response(error, 'Failed to get schedule result')


@router.get('/surgery-details/{mrn}')
def surgery_details(mrn: str, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(ScheduleResults).where(
        ScheduleResults.mrn == mrn).first()
    if query is None:
        send_error_response('MRN not found')
    return query


@router.post('/generate')
def generate_daily_schedule(
    file: UploadFile = File(...),
    master_plan_id: str = Form(...),
    start_date: date = Form(...),
    end_date: date = Form(...),
    resource: str = Form(...),
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    try:
        resources = [
            ScheduleResourceSchema(**item) for item in json.loads(resource)]
        resource_map = {r.id: r for r in session.query(ScheduleResource).where(
            ScheduleResource.id.in_([item.id for item in resources])).all()}
        for item in resources:
            if item.id in resource_map:
                for key, value in item.dict().items():
                    if value is not None:
                        setattr(resource_map[item.id], key, value)
        session.commit()
    except Exception:
        pass

    status = session.query(Status).where(
        Status.description.ilike('available')
    ).first()
    if status is None:
        send_error_response(
            'Status "Available" not found in database.'
        )

    check_excell_format(file, session, token)
    contents = file.file.read()
    excel_data = BytesIO(contents)
    workbook = load_workbook(excel_data)
    sheet = workbook.active

    start_date_dt = parse_date(start_date)
    end_date_dt = parse_date(end_date)

    if start_date_dt.weekday() != 0:
        send_error_response('Start date must be a Monday')
    if end_date_dt.weekday() != 4:
        send_error_response('End date must be a Friday')
    if start_date_dt > end_date_dt:
        send_error_response('Start date cannot be after end date')

    master_plan = session.query(Masterplan).where(
        Masterplan.id == master_plan_id).first()
    if master_plan is None:
        send_error_response('Master plan not found')

    run_id = f"RUN-{int(datetime.now().timestamp())}"

    available_ots = session.scalars(
        session.query(Ot.id).order_by(Ot.id.asc())).all()
    ot_unit_map = {
        assignment.ot_id: assignment.unit_id
        for assignment in session.query(OtAssignment).where(OtAssignment.mssp_id == master_plan.id).all()
    }

    operation_dates = []
    current_date = start_date_dt
    while current_date <= end_date_dt:
        if current_date.weekday() < 5:
            operation_dates.append(current_date)
        current_date += timedelta(days=1)

    ot_time_tracking = {}
    work_day_minutes = 8 * 60
    schedule_results = []
    date_index = 0
    ot_load_balance = {ot_id: 0 for ot_id in available_ots}

    try:
        run_ids = session.query(ScheduleResults.run_id).where(
            ScheduleResults.surgery_date.in_([start_date, end_date])).distinct().all()
        run_id_list = [run_id[0] for run_id in run_ids]
        if run_id_list:
            session.query(ScheduleResults).where(ScheduleResults.run_id.in_(
                run_id_list)).delete(synchronize_session=False)
        session.commit()
    except Exception as error:
        send_error_response(error, 'Failed to remove old schedule result')

    for row_idx, row in enumerate([row for row in sheet.iter_rows(  # type: ignore
            min_row=2, values_only=True)], start=2):
        unit_data = session.query(Unit).where(
            cast(Unit.name, String).ilike(f"%{row[8]}%")).first()
        if unit_data is None:
            continue

        if unit_data.id not in ot_unit_map.values():
            continue

        duration_str = str(row[11])
        if not duration_str.isdigit() or len(duration_str) != 4:
            send_error_response(
                f"Invalid duration format at row {row_idx}")
        duration_hours = int(duration_str[:2])
        duration_minutes = int(duration_str[2:])
        if not (0 <= duration_hours < 24 and 0 <= duration_minutes < 60):
            send_error_response("Duration out of valid range")
        duration = duration_hours * 60 + duration_minutes
        if duration > work_day_minutes:
            continue

        procedure_name = row[10]
        if isinstance(procedure_name, str) and "-" in procedure_name:
            procedure_name = procedure_name.split("-", 1)[-1].strip()
        procedure_name = f"PROCEDURE - {procedure_name}"

        sorted_ots = sorted(
            [
                ot_id for ot_id, unit_id
                in ot_unit_map.items()
                if unit_id == unit_data.id
            ],
            key=lambda
            ot: ot_load_balance[ot]
        )
        for ot_ids in sorted_ots:
            operation_date = operation_dates[date_index % len(
                operation_dates)]

            day_id = session.query(Day.id).where(
                Day.name == operation_date.strftime('%A')
            ).scalar()
            if not day_id:
                send_error_response(f"Day not found for date {operation_date}")

            matching_week = session.query(Week).where(
                Week.name == calculate_week_name(operation_date.date())).first()
            if not matching_week:
                continue

            monday_of_week = operation_date - \
                timedelta(days=operation_date.weekday())
            matching_month = session.query(Month).where(
                cast(Month.name, String).ilike(f"%{monday_of_week.strftime('%B')}%")).first()
            if not matching_month:
                send_error_response(
                    f"Month not found for date {operation_date}")

            key = (ot_ids, day_id, matching_week.id, operation_date)
            if key not in ot_time_tracking:
                ot_time_tracking[key] = datetime.combine(
                    operation_date,
                    time(8, 0)
                )

            ot_start_datetime = ot_time_tracking[key]
            ot_end_datetime = ot_start_datetime + timedelta(minutes=duration)
            if ot_end_datetime.time() > time(16, 0):
                continue
            remaining_minutes = work_day_minutes - (
                ot_start_datetime.hour * 60 + ot_start_datetime.minute - 480)
            if duration > remaining_minutes:
                continue
            ot_time_tracking[key] = ot_end_datetime

            ot_load_balance[ot_ids] += 1

            schedule_result = ScheduleResultsSchema(
                run_id=run_id,
                unit_id=unit_data.id,
                mrn=str(row[1]),
                age=row[2],  # type: ignore
                week_id=matching_week.id,  # type: ignore
                day_id=day_id,
                month_id=matching_month.id,  # type: ignore
                surgery_date=ot_start_datetime.date(),
                type_of_surgery=str(row[7]),
                sub_specialty_desc=str(row[8]),
                specialty_id=str(row[9]),
                procedure_name=procedure_name,
                surgery_duration=duration,
                phu_id=unit_data.id,  # type: ignore
                phu_start_time=(
                    ot_start_datetime - timedelta(minutes=60)).time(),
                phu_end_time=ot_start_datetime.time(),
                ot_id=ot_ids,
                ot_start_time=ot_start_datetime.time(),
                ot_end_time=ot_end_datetime.time(),
                surgeon_name=str(row[13]),
                booked_by=str(row[12]),
                post_op_id=unit_data.id,  # type: ignore
                post_op_start_time=ot_end_datetime.time(),
                post_op_end_time=add_duration(
                    ot_end_datetime.strftime("%H:%M"), 30),
                pacu_id=unit_data.id,  # type: ignore
                pacu_start_time=ot_end_datetime.time(),
                pacu_end_time=add_duration(
                    ot_end_datetime.strftime("%H:%M"), 90),
                icu_id=unit_data.id,  # type: ignore
                icu_start_time=add_duration(
                    ot_end_datetime.strftime("%H:%M"), 90),
                icu_end_time=add_duration(
                    ot_end_datetime.strftime("%H:%M"), 330)
            )
            schedule_results.append(
                ScheduleResults(**schedule_result.dict()))
            date_index += 1
            break

    file.file.seek(0)
    try:
        session.add_all(schedule_results)
        session.commit()
        return {"run_id": run_id, "message": "Schedule generated successfully"}
    except Exception as error:
        send_error_response(str(error), 'Cannot create daily schedule')


@router.get('/run_id')
def distinct_run_ids(limit: int = 10, offset: int = 0, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        subquery = (
            session.query(
                ScheduleResults.run_id,
                func.min(ScheduleResults.id).label('min_id')
            )
            .group_by(ScheduleResults.run_id)  # type: ignore
            .order_by(func.min(ScheduleResults.id))
            .subquery()
        )
        total_query = session.query(func.count(subquery.c.run_id)).scalar()
        data_query = (
            session.query(subquery.c.run_id)
            .order_by(subquery.c.min_id)  # type: ignore
            .limit(limit)
            .offset(offset)
        )
        data = [{"run_id": row.run_id} for row in data_query.all()]
        return {
            "total": total_query,
            "data": data
        }
    except Exception as error:
        send_error_response(str(error), 'Failed get run ids')


@router.get('/export')
def export_schedule_results(run_id: str, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    schedule_result = session.query(ScheduleResults).where(
        ScheduleResults.run_id == run_id).all()
    if not schedule_result:
        send_error_response('Run ID not found')
    data = [r.__dict__ for r in schedule_result]
    df = DataFrame(data)
    output = BytesIO()
    df.to_excel(output, index=False, engine='openpyxl')
    output.seek(0)
    filename = datetime.now().strftime(
        f'schedule_results_{run_id}_%Y-%B-%d_%H:%M:%S.xlsx'
    )
    return StreamingResponse(
        output,
        media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        headers={"Content-Disposition": f"attachment; filename={filename}"}
    )


@router.post('/validity')
def check_excell_format(file: UploadFile = File(...), session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    if file.content_type not in ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel"]:
        send_error_response('Wrong file type, only accept xlsx')
    expected_headers = [
        "BOOKING DATE", "MRN", "AGE", "GENDER", "DIAGNOSIS", "COMMENT",
        "ANAES_TYPE", "TYPE_OF_OPERATION", "SUB_SPECIALITY_DESC", "SPECIALITY_ID",
        "PROCEDURE_NAME", "DURATION", "BOOKED_BY", "SURGEON1", "PACU_REQUIRED",
    ]
    contents = file.file.read()
    excel_data = BytesIO(contents)
    workbook = load_workbook(excel_data)
    sheet = workbook.active
    actual_headers = [cell.value for cell in sheet[1]]  # type: ignore
    for idx, (expected, actual) in enumerate(zip(expected_headers, actual_headers), start=1):
        if expected != actual:
            send_error_response(
                f"Column {idx}: Expected '{expected}', found '{actual}'"
            )
    procedure_names = {p.name for p in session.query(ProcedureName).all()}
    unit_names = {u.name for u in session.query(Unit).all()}
    for row_idx, row in enumerate(
        sheet.iter_rows(min_row=2, values_only=True),  # type: ignore
        start=2
    ):
        procedure_name = str(row[10])
        subspeciality_desc = str(row[8])
        if "-" in procedure_name:
            procedure_name = procedure_name.split("-", 1)[-1].strip()
        procedure_name = f"PROCEDURE - {procedure_name}"

        if procedure_name not in procedure_names:
            send_error_response(
                f'{procedure_name} in column PROCEDURE NAME and in row {row_idx} not found in database.')
        # if subspeciality_desc not in unit_names:
        #     send_error_response(
        #         f'{subspeciality_desc} in column SUBSPECIALITY DESC and in row {row_idx} not found in database.')
    file.file.seek(0)
    return {'message': 'Excel file is valid with correct headers and data matching the database.'}


@router.get('/template')
def download_template(token: str = Depends(TokenAuthorization)):
    workbook = Workbook()
    sheet = workbook.active
    sheet.title = "template"  # type: ignore
    headers = [
        "BOOKING DATE", "MRN", "AGE", "GENDER", "DIAGNOSIS", "COMMENT",
        "ANAES_TYPE", "TYPE_OF_OPERATION", "SUB_SPECIALITY_DESC", "SPECIALITY_ID",
        "PROCEDURE_NAME", "DURATION", "BOOKED_BY", "SURGEON1", "PACU_REQUIRED",
    ]
    for col_num, header in enumerate(headers, 1):
        sheet.cell(row=1, column=col_num, value=header)  # type: ignore
    output = BytesIO()
    workbook.save(output)
    output.seek(0)
    filename = datetime.now().strftime(f'dailyschedule_format_%Y-%B-%d_%H:%M:%S.xlsx')
    return StreamingResponse(
        output,
        media_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        headers={"Content-Disposition": f"attachment; filename={filename}"}
    )
