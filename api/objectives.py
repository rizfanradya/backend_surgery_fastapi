from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.objectives import Objectives
from schemas.objectives import ObjectivesSchema, ObjectivesResponseSchema

router = APIRouter()


@router.post('/objectives')
def create_objectives(objectives: ObjectivesSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Objectives(**objectives.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'Cannot insert this data')


@router.put('/objectives/{id}')
def update_objectives(id: int, objectives: ObjectivesSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Objectives).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in objectives.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'Cannot update this data')


@router.get('/objectives', response_model=ObjectivesResponseSchema)
def get_objectives(limit: int = 10, offset: int = 0, search: Optional[str] = None, objectives_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Objectives)
    if objectives_id:
        query = query.where(Objectives.id == objectives_id)
    if search:
        query = query.filter(or_(*[getattr(Objectives, column).ilike(
            f"%{search}%"
        ) for column in Objectives.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/objectives/{id}')
def delete_objectives(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Objectives).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
