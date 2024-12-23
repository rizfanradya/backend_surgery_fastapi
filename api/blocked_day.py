from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.blocked_day import BlockedDay
from schemas.blocked_day import BlockedDaySchema, BlockedDayResponseSchema

router = APIRouter()


@router.post('/blocked_day')
def create_blocked_day(blocked_day: BlockedDaySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = BlockedDay(**blocked_day.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'day id or unit id not found')


@router.put('/blocked_day/{id}')
def update_blocked_day(id: int, blocked_day: BlockedDaySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(BlockedDay).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in blocked_day.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'day id or unit id not found')


@router.get('/blocked_day', response_model=BlockedDayResponseSchema)
def get_blocked_day(limit: int = 10, offset: int = 0, search: Optional[str] = None, blocked_day_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(BlockedDay)
    if blocked_day_id:
        query = query.where(BlockedDay.id == blocked_day_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(BlockedDay, column), String).ilike(f"%{search}%")
            if getattr(BlockedDay, column).type.python_type == str
            else cast(getattr(BlockedDay, column), String).ilike(f"%{search}%")
            for column in BlockedDay.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/blocked_day/{id}')
def delete_blocked_day(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(BlockedDay).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
