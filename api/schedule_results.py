from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.schedule_results import ScheduleResults
from schemas.schedule_results import ScheduleResultsSchema, ScheduleResultsResponseSchema

router = APIRouter()


@router.post('/schedule_results')
def create_schedule_results(schedule_results: ScheduleResultsSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = ScheduleResults(**schedule_results.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(
            str(error),
            'format time or date is invalid or masterplan id or ot id or unit id in ot assignment not found'
        )


@router.put('/schedule_results/{id}')
def update_schedule_results(id: int, schedule_results: ScheduleResultsSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(ScheduleResults).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in schedule_results.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(
            str(error),
            'format time or date is invalid or masterplan id or ot id or unit id in ot assignment not found'
        )


@router.get('/schedule_results', response_model=ScheduleResultsResponseSchema)
def get_schedule_results(limit: int = 10, offset: int = 0, search: Optional[str] = None, schedule_results_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(ScheduleResults)
    if schedule_results_id:
        query = query.where(ScheduleResults.id == schedule_results_id)
    if search:
        query = query.filter(or_(*[getattr(ScheduleResults, column).ilike(
            f"%{search}%"
        ) for column in ScheduleResults.__table__.columns.keys(  # type: ignore
        )]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/schedule_results/{id}')
def delete_schedule_results(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(ScheduleResults).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
