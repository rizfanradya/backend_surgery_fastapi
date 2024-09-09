from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.week import Week
from schemas.week import WeekSchema, GetWeekResponseSchema
from typing import Optional
from sqlalchemy import or_

router = APIRouter()


@router.post('/week')
def create_week(week: WeekSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Week(**week.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'status id not found')


@router.put('/week/{id}')
def update_week(id: int, week: WeekSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data_info = session.query(Week).get(id)
        if data_info is None:
            send_error_response('Data not found')
        for key, value in week.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'status id not found')


@router.get('/week', response_model=GetWeekResponseSchema)
def get_week(limit: int = 10, offset: int = 0, search: Optional[str] = None, week_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Week)
    if week_id:
        query = query.where(Week.id == week_id)
    if search:
        query = query.filter(or_(*[getattr(Week, column).ilike(
            f"%{search}%"
        ) for column in Week.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/week/{id}')
def delete_week(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data = session.query(Week).get(id)
    if data:
        session.delete(data)
        session.commit()
