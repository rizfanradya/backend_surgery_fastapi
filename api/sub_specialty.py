from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.sub_specialty import SubSpecialty
from schemas.sub_specialty import SubSpecialtySchema, GetSubSpecialtyResponseSchema

router = APIRouter()


@router.post('/sub_specialty')
def create_sub_specialty(sub_specialty: SubSpecialtySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = SubSpecialty(**sub_specialty.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'specialty id not found')


@router.put('/sub_specialty/{id}')
def update_sub_specialty(id: int, sub_specialty: SubSpecialtySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(SubSpecialty).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in sub_specialty.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'specialty id not found')


@router.get('/sub_specialty', response_model=GetSubSpecialtyResponseSchema)
def get_sub_specialty(limit: int = 10, offset: int = 0, search: Optional[str] = None, sub_specialty_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(SubSpecialty)
    if sub_specialty_id:
        query = query.where(SubSpecialty.id == sub_specialty_id)
    if search:
        query = query.filter(or_(*[getattr(SubSpecialty, column).ilike(
            f"%{search}%"
        ) for column in SubSpecialty.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/sub_specialty/{id}')
def delete_sub_specialty(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(SubSpecialty).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
