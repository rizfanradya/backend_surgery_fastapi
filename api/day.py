from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.day import Day
from schemas.day import DaySchema, DayResponseSchema
from typing import Optional
from sqlalchemy import or_

router = APIRouter()


@router.post('/day')
def create_day(day: DaySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Day(**day.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'week id not found')


@router.put('/day/{id}')
def update_day(id: int, day: DaySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Day).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in day.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'week id not found')


@router.get('/day', response_model=DayResponseSchema)
def get_day(limit: int = 10, offset: int = 0, search: Optional[str] = None, day_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Day)
    if day_id:
        query = query.where(Day.id == day_id)
    if search:
        query = query.filter(or_(*[getattr(Day, column).ilike(
            f"%{search}%"
        ) for column in Day.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/day/{id}')
def delete_day(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Day).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
