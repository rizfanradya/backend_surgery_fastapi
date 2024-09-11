from fastapi import APIRouter, Depends, UploadFile, File, Form
from utils.database import get_db
from sqlalchemy.orm import Session
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from utils.map_day_of_week_to_day_id import map_day_of_week_to_day_id
from utils.parse_date import parse_date
from utils.add_duration import add_duration
from datetime import date as dt_datetime, datetime, time
from openpyxl import load_workbook
from io import BytesIO
from typing import Dict
from schemas.schedule_results import ScheduleResultsSchema
from models.masterplan import Masterplan
from models.ot_assignment import OtAssignment
from models.schedule_results import ScheduleResults

router = APIRouter()


@router.get('/result')
def schedule_results_and_filter(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/surgery-details/{mrn_id}')
def surgery_details(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/generate')
def generate_daily_schedule(
    file: UploadFile = File(...),
    master_plan_id: int = Form(...),
    start_date: dt_datetime = Form(...),
    end_date: dt_datetime = Form(...),
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    if file.content_type not in ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel"]:
        send_error_response('Wrong file type, only accept xlsx')
    expected_headers = [
        "BOOKING_DATE", "MRN", "AGE", "GENDER", "DIAGNOSIS", "COMMENT",
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

    run_id = f"RUN-{int(datetime.now().timestamp())}"
    master_plan = session.query(Masterplan).where(
        Masterplan.id == master_plan_id).first()
    if master_plan is None:
        send_error_response('Master plan not found')

    ot_start_time_map: Dict[str, time] = {}
    for row_idx, row in enumerate(
        sheet.iter_rows(min_row=2, values_only=True),  # type: ignore
        start=2
    ):
        try:
            booking_date = parse_date(str(row[0]))
        except ValueError as error:
            send_error_response(
                f"Invalid date format for booking date: {error}"
            )

        try:
            age = int(str(row[2]))
        except ValueError as error:
            send_error_response(f"Invalid age format: {error}")

        duration_str = str(row[11])
        try:
            duration_hours = int(duration_str[:2])
            duration_minutes = int(duration_str[2:])
            duration = duration_hours * 60 + duration_minutes
        except ValueError as error:
            send_error_response(f"Invalid duration format: {error}")

        ot_assignment = session.query(OtAssignment).where(
            OtAssignment.mssp_id == master_plan_id).first()
        if ot_assignment is None:
            continue

        day_key = booking_date.strftime('%Y-%m-%d')
        ot_start_time = ot_start_time_map.get(day_key, time(8, 0))
        ot_end_time = add_duration(str(ot_start_time), duration)
        ot_start_time_map[day_key] = ot_end_time

        schedule_results_schema = ScheduleResultsSchema(
            run_id=run_id,
            mrn=str(row[1]),
            age=age,
            week_id=map_day_of_week_to_day_id(str(booking_date), session),
            week_day=booking_date.strftime('%A'),
            surgery_date=booking_date.date(),
            type_of_surgery=str(row[7]),
            sub_specialty_desc=str(row[8]),
            specialty_id=str(row[9]),
            procedure_name=str(row[10]),
            surgery_duration=duration,
            phu_id=ot_assignment.unit_id,
            phu_start_time=ot_start_time,
            phu_end_time=ot_end_time,
            ot_id=ot_assignment.ot_id,
            ot_start_time=ot_start_time,
            ot_end_time=ot_end_time,
            surgeon_name=str(row[13]),
            post_op_id=ot_assignment.unit_id,
            post_op_start_time=ot_end_time,
            post_op_end_time=add_duration(str(ot_end_time), 30),
            pacu_id=ot_assignment.unit_id,
            pacu_start_time=ot_end_time,
            pacu_end_time=add_duration(str(ot_end_time), 60),
            icu_id=ot_assignment.unit_id,
            icu_start_time=add_duration(str(ot_end_time), 60),
            icu_end_time=add_duration(str(ot_end_time), 240)
        )
        new_schedule_results = ScheduleResults(
            **schedule_results_schema.dict()
        )
        session.add(new_schedule_results)
        session.commit()
        session.refresh(new_schedule_results)

    return {
        "run_id": run_id,
        "message": "Schedule generated successfully"
    }


@router.get('/run_id')
def distinct_run_ids(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/export')
def export_schedule_results(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'
