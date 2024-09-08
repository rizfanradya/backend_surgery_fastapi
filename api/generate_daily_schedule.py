from fastapi import APIRouter, Depends
from utils.database import get_db
from sqlalchemy.orm import Session
from utils.auth import TokenAuthorization

router = APIRouter()


@router.get('/legend')
def subspecialty_colors(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/filter-specialty')
def filter_specialty(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/filter-ot')
def filter_ot(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/result')
def schedule_results_and_filter(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/surgery-details/{mrn_id}')
def surgery_details(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/generate')
def generate_daily_schedule(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/run_id')
def distinct_run_ids(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/export')
def export_schedule_results(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'
