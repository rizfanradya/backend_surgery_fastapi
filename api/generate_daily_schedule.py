from collections import defaultdict
from fastapi import APIRouter, Depends, UploadFile, File, Form
from fastapi.responses import StreamingResponse
from utils.database import get_db
from sqlalchemy.orm import Session
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from utils.map_day_of_week_to_day_id import map_day_of_week_to_day_id
from utils.parse_date import parse_date
from utils.add_duration import add_duration
from utils.next_available_time import next_available_time
from datetime import date as dt_datetime, datetime, time, timedelta
from itertools import cycle
from openpyxl import load_workbook, Workbook
from pandas import DataFrame
from io import BytesIO
import json
from sqlalchemy import func, cast, String
from typing import List, Optional
from schemas.schedule_results import ScheduleResultsSchema
from schemas.generate_daily_schedule import ScheduleResourceSchema
from models.masterplan import Masterplan
from models.ot_assignment import OtAssignment
from models.schedule_results import ScheduleResults
from models.ot import Ot
from models.sub_specialty import SubSpecialty
from models.unit import Unit
from models.procedure_name import ProcedureName
from models.schedule_resource import ScheduleResource

router = APIRouter()


@router.get('/result')
def schedule_results_and_filter(
    surgery_date: dt_datetime,
    ot_id: Optional[int] = None,
    subspecialty_id: Optional[str] = None,
    surgeon_name: Optional[str] = None,
    patient_name: Optional[str] = None,
    limit: int = 10,
    offset: int = 0,
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    schedule_results = session.query(
        ScheduleResults,
        ProcedureName.sub_specialty_id,
        SubSpecialty.color_hex,
        SubSpecialty.description.label('sub_specialty_desc')
    ).join(
        ProcedureName, ProcedureName.name == ScheduleResults.procedure_name
    ).join(
        SubSpecialty, SubSpecialty.id == ProcedureName.sub_specialty_id
    ).where(
        ScheduleResults.surgery_date == surgery_date
    )

    if ot_id:
        schedule_results = schedule_results.where(
            ScheduleResults.ot_id == ot_id
        )
    if subspecialty_id:
        schedule_results = schedule_results.where(
            SubSpecialty.id == subspecialty_id)
    if patient_name:
        schedule_results = schedule_results.where(
            cast(ScheduleResults.booked_by, String).ilike(f'%{patient_name}%'))

    surgeon_name_list = [
        result.surgeon_name for result, *_ in schedule_results.distinct(
            ScheduleResults.surgeon_name
        ).all()
    ]
    if surgeon_name:
        schedule_results = schedule_results.where(
            ScheduleResults.surgeon_name == surgeon_name
        )

    total = schedule_results.count()
    schedule_results = schedule_results.limit(limit).offset(offset).all()
    ot_data = session.query(Ot).order_by(Ot.id.asc()).all()
    subspecialties = session.query(SubSpecialty).order_by(
        SubSpecialty.id.asc()).all()
    color_map = {sub.description: sub.color_hex for sub in subspecialties}

    ot_data_count = {}
    for result, _, _, _ in schedule_results:
        ot_data_count[result.ot_id] = ot_data_count.get(result.ot_id, 0) + 1

    for ot in ot_data:
        count = ot_data_count.get(ot.id, 0)
        ot.category = f"OT {ot.id}\n{count} Surgeries"

    formatted_results = []
    for result, sub_specialty_id, color_hex, sub_specialty_desc in schedule_results:
        get_odc = ot_data_count.get(result.ot_id, 0)
        result.category = f"OT {result.ot_id}\n{get_odc} Surgeries"
        result.task = f"MRN-{result.mrn}"
        result.color = color_hex or color_map.get(sub_specialty_desc, "")
        result.sub_specialty_desc = sub_specialty_desc
        formatted_results.append(result)

    return {
        "total": total,
        "data": formatted_results,
        "ot": ot_data,
        "subspecialty": subspecialties,
        "surgeon_name_list": surgeon_name_list
    }


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
    start_date: dt_datetime = Form(...),
    end_date: dt_datetime = Form(...),
    resource: str = Form(...),
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    try:
        resources = [
            ScheduleResourceSchema(**item)for item in json.loads(resource)]
        resource_map = {r.id: r for r in session.query(ScheduleResource).filter(
            ScheduleResource.id.in_([item.id for item in resources])).all()}
        for item in resources:
            if item.id in resource_map:
                for key, value in item.dict().items():
                    if value is not None:
                        setattr(resource_map[item.id], key, value)
        session.commit()
    except Exception:
        pass

    check_excell_format(file, session, token)
    contents = file.file.read()
    excel_data = BytesIO(contents)
    workbook = load_workbook(excel_data)
    sheet = workbook.active

    start_date_dt = parse_date(start_date)
    end_date_dt = parse_date(end_date)

    if start_date_dt > end_date_dt:  # type: ignore
        send_error_response('Start date cannot be after end date')

    operation_dates = [
        start_date_dt + timedelta(days=i)  # type: ignore
        for i in range((end_date_dt - start_date_dt).days + 1)  # type: ignore
        if (start_date_dt + timedelta(days=i)).weekday() < 5
    ]
    operation_date_cycle = cycle(operation_dates)

    master_plan = session.query(Masterplan).where(
        Masterplan.id == master_plan_id).first()
    if master_plan is None:
        send_error_response('Master plan not found')

    run_id = f"RUN-{int(datetime.now().timestamp())}"
    schedule_results: List[ScheduleResults] = []
    last_end_time = defaultdict(lambda: defaultdict(lambda: time(8, 0)))

    for row_idx, row in enumerate(sheet.iter_rows(  # type: ignore
        min_row=2,
        values_only=True
    ), start=2):
        ot_assignment = session.query(OtAssignment).where(
            OtAssignment.mssp_id == master_plan_id,
            OtAssignment.mrn == str(row[1])
        ).first()  # type: ignore
        if ot_assignment is None:
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

        operation_date: dt_datetime = next(operation_date_cycle)

        procedure_name = row[10]
        if isinstance(procedure_name, str) and "-" in procedure_name:
            procedure_name = procedure_name.split("-", 1)[-1].strip()
        procedure_name = f"PROCEDURE - {procedure_name}"

        ot_id: int = ot_assignment.ot_id  # type: ignore
        ot_start_time = last_end_time[ot_id][operation_date]
        ot_start_datetime = datetime.combine(
            operation_date, ot_start_time)  # type: ignore
        phu_end_time = ot_start_datetime + timedelta(minutes=duration)
        ot_end_datetime = phu_end_time + timedelta(minutes=duration)
        last_end_time[ot_id][operation_date] = ot_end_datetime.time()

        post_op_start_time = ot_end_datetime.time()
        post_op_end_time = add_duration(
            post_op_start_time.strftime("%H:%M"), 30)

        pacu_end_time = add_duration(post_op_end_time.strftime("%H:%M"), 60)
        icu_end_time = add_duration(pacu_end_time.strftime("%H:%M"), 240)

        schedule_result = ScheduleResultsSchema(
            run_id=run_id,
            mrn=str(row[1]),
            age=row[2],  # type: ignore
            week_id=map_day_of_week_to_day_id(str(operation_date), session),
            week_day=operation_date.strftime('%A'),
            surgery_date=operation_date.date(),
            type_of_surgery=str(row[7]),
            sub_specialty_desc=str(row[8]),
            specialty_id=str(row[9]),
            procedure_name=procedure_name,
            surgery_duration=duration,
            phu_id=ot_assignment.unit_id,  # type: ignore
            phu_start_time=ot_start_datetime.time(),
            phu_end_time=phu_end_time.time(),
            ot_id=ot_id,  # type: ignore
            ot_start_time=phu_end_time.time(),
            ot_end_time=ot_end_datetime.time(),
            surgeon_name=str(row[13]),
            booked_by=str(row[12]),
            post_op_id=ot_assignment.unit_id,  # type: ignore
            post_op_start_time=post_op_start_time,
            post_op_end_time=post_op_end_time,
            pacu_id=ot_assignment.unit_id,  # type: ignore
            pacu_start_time=post_op_start_time,
            pacu_end_time=pacu_end_time,
            icu_id=ot_assignment.unit_id,  # type: ignore
            icu_start_time=pacu_end_time,
            icu_end_time=icu_end_time
        )
        schedule_results.append(ScheduleResults(**schedule_result.dict()))

    file.file.seek(0)
    try:
        session.add_all(schedule_results)
        session.commit()
        return {
            "run_id": run_id,
            "message": "Schedule generated successfully"
        }
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
