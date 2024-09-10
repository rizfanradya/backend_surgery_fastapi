from fastapi import APIRouter, Depends, UploadFile, File, Form
from utils.database import get_db
from sqlalchemy.orm import Session
from utils.auth import TokenAuthorization
from datetime import date as dt_datetime
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
    return 'ok'


@router.get('/run_id')
def distinct_run_ids(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/export')
def export_schedule_results(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'
