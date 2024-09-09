from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.ot_type import OtType
from schemas.ot_type import OtTypeSchema, GetOtTypeResponseSchema
from typing import Optional
from sqlalchemy import or_

router = APIRouter()


@router.post('/ot_type')
def create_ot_type(ot_type: OtTypeSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    new_data = OtType(**ot_type.dict())
    session.add(new_data)
    session.commit()
    session.refresh(new_data)
    return new_data


@router.put('/ot_type/{id}')
def update_ot_type(id: int, ot_type: OtTypeSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(OtType).get(id)
    if data_info is None:
        send_error_response('Procedure Name not found')
    for key, value in ot_type.dict().items():
        if value is not None:
            setattr(data_info, key, value)
    session.commit()
    session.refresh(data_info)
    return data_info


@router.get('/ot_type', response_model=GetOtTypeResponseSchema)
def get_ot_type(limit: int = 10, offset: int = 0, search: Optional[str] = None, ot_type_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(OtType)
    if ot_type_id:
        query = query.where(OtType.id == ot_type_id)
    if search:
        query = query.filter(or_(*[getattr(OtType, column).ilike(
            f"%{search}%"
        ) for column in OtType.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/ot_type/{id}')
def delete_ot_type(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data = session.query(OtType).get(id)
    if data:
        session.delete(data)
        session.commit()
