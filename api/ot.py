from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.ot import Ot
from schemas.ot import OtSchema, GetOtResponseSchema
from typing import Optional
from sqlalchemy import or_

router = APIRouter()


@router.post('/ot')
def create_ot(ot: OtSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    new_data = Ot(**ot.dict())
    session.add(new_data)
    session.commit()
    session.refresh(new_data)
    return new_data


@router.put('/ot/{id}')
def update_ot(id: int, ot: OtSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Ot).get(id)
    if data_info is None:
        send_error_response('Data not found')
    for key, value in ot.dict().items():
        if value is not None:
            setattr(data_info, key, value)
    session.commit()
    session.refresh(data_info)
    return data_info


@router.get('/ot', response_model=GetOtResponseSchema)
def get_ot(limit: int = 10, offset: int = 0, search: Optional[str] = None, ot_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Ot)
    if ot_id:
        query = query.where(Ot.id == ot_id)
    if search:
        query = query.filter(or_(*[getattr(Ot, column).ilike(
            f"%{search}%"
        ) for column in Ot.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/ot/{id}')
def delete_ot(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data = session.query(Ot).get(id)
    if data:
        session.delete(data)
        session.commit()
