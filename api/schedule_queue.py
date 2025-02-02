from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.schedule_queue import ScheduleQueue
from schemas.schedule_queue import ScheduleQueueSchema, ScheduleQueueResponseSchema

router = APIRouter()


@router.post('/schedule_queue')
def create_schedule_queue(schedule_queue: ScheduleQueueSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = ScheduleQueue(**schedule_queue.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'day id or unit id not found')


@router.put('/schedule_queue/{id}')
def update_schedule_queue(id: int, schedule_queue: ScheduleQueueSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(ScheduleQueue).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in schedule_queue.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'day id or unit id not found')


@router.get('/schedule_queue', response_model=ScheduleQueueResponseSchema)
def get_schedule_queue(limit: int = 10, offset: int = 0, search: Optional[str] = None, schedule_queue_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(ScheduleQueue)
    if schedule_queue_id:
        query = query.where(ScheduleQueue.id == schedule_queue_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(ScheduleQueue, column),
                 String).ilike(f"%{search}%")
            if getattr(ScheduleQueue, column).type.python_type == str
            else cast(getattr(ScheduleQueue, column), String).ilike(f"%{search}%")
            for column in ScheduleQueue.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/schedule_queue/{id}')
def delete_schedule_queue(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(ScheduleQueue).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
