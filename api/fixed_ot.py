from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.fixed_ot import FixedOt
from schemas.fixed_ot import FixedOtSchema, GetFixedOtResponseSchema

router = APIRouter()


@router.post('/fixed_ot')
def create_fixed_ot(fixed_ot: FixedOtSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = FixedOt(**fixed_ot.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'ot id or unit id not found')


@router.put('/fixed_ot/{id}')
def update_fixed_ot(id: int, fixed_ot: FixedOtSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(FixedOt).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in fixed_ot.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'ot id or unit id not found')


@router.get('/fixed_ot', response_model=GetFixedOtResponseSchema)
def get_fixed_ot(limit: int = 10, offset: int = 0, search: Optional[str] = None, fixed_ot_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(FixedOt)
    if fixed_ot_id:
        query = query.where(FixedOt.id == fixed_ot_id)
    if search:
        query = query.filter(or_(*[getattr(FixedOt, column).ilike(
            f"%{search}%"
        ) for column in FixedOt.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/fixed_ot/{id}')
def delete_fixed_ot(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(FixedOt).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
