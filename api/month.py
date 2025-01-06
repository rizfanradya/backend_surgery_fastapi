from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.month import Month
from schemas.month import MonthSchema, MonthResponseSchema
from typing import Optional
from sqlalchemy import or_, cast, String

router = APIRouter()


@router.post('/month')
def create_month(month: MonthSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Month(**month.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'status id not found')


@router.put('/month/{id}')
def update_month(id: int, month: MonthSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Month).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in month.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'status id not found')


@router.get('/month', response_model=MonthResponseSchema)
def get_month(limit: int = 10, offset: int = 0, search: Optional[str] = None, month_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Month)
    if month_id:
        query = query.where(Month.id == month_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(Month, column), String).ilike(f"%{search}%")
            if getattr(Month, column).type.python_type == str
            else cast(getattr(Month, column), String).ilike(f"%{search}%")
            for column in Month.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/month/{id}')
def delete_month(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Month).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
