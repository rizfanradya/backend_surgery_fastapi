from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.unit import Unit
from schemas.unit import UnitSchema, GetUnitResponseSchema
from typing import Optional
from sqlalchemy import or_

router = APIRouter()


@router.post('/unit')
def create_unit(unit: UnitSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    new_data = Unit(**unit.dict())
    session.add(new_data)
    session.commit()
    session.refresh(new_data)
    return new_data


@router.put('/unit/{id}')
def update_unit(id: int, unit: UnitSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Unit).get(id)
    if data_info is None:
        send_error_response('Procedure Name not found')
    for key, value in unit.dict().items():
        if value is not None:
            setattr(data_info, key, value)
    session.commit()
    session.refresh(data_info)
    return data_info


@router.get('/unit', response_model=GetUnitResponseSchema)
def get_unit(limit: int = 10, offset: int = 0, search: Optional[str] = None, unit_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Unit)
    if unit_id:
        query = query.where(Unit.id == unit_id)
    if search:
        query = query.filter(or_(*[getattr(Unit, column).ilike(
            f"%{search}%"
        ) for column in Unit.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/unit/{id}')
def delete_unit(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data = session.query(Unit).get(id)
    if data:
        session.delete(data)
        session.commit()
