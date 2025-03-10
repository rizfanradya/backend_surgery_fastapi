from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.unit import Unit
from schemas.unit import UnitSchema, UnitResponseSchema
from typing import Optional
from sqlalchemy import or_, cast, String

router = APIRouter()


@router.post('/unit')
def create_unit(unit: UnitSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Unit(**unit.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'subspecialty id not found')


@router.put('/unit/{id}')
def update_unit(id: int, unit: UnitSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Unit).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in unit.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'subspecialty id not found')


@router.get('/unit', response_model=UnitResponseSchema)
def get_unit(limit: int = 10, offset: int = 0, search: Optional[str] = None, unit_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Unit)
    if unit_id:
        query = query.where(Unit.id == unit_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(Unit, column), String).ilike(f"%{search}%")
            if getattr(Unit, column).type.python_type == str
            else cast(getattr(Unit, column), String).ilike(f"%{search}%")
            for column in Unit.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/unit/{id}')
def delete_unit(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Unit).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
