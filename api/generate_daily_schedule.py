from fastapi import APIRouter, Depends, UploadFile, File, Form
from utils.database import get_db
from sqlalchemy.orm import Session
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from datetime import date as dt_datetime, datetime
from openpyxl import load_workbook
from io import BytesIO
from models.masterplan import Masterplan

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

    return 'ok'


@router.get('/run_id')
def distinct_run_ids(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/export')
def export_schedule_results(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'
