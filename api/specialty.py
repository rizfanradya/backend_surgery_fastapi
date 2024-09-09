from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.specialty import Specialty
from schemas.specialty import SpecialtySchema, GetSpecialtyResponseSchema

router = APIRouter()


@router.post('/specialty')
def create_specialty(specialty: SpecialtySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    new_data = Specialty(**specialty.dict())
    session.add(new_data)
    session.commit()
    session.refresh(new_data)
    return new_data


@router.put('/specialty/{id}')
def update_specialty(id: int, specialty: SpecialtySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Specialty).get(id)
    if data_info is None:
        send_error_response('Data not found')
    for key, value in specialty.dict().items():
        if value is not None:
            setattr(data_info, key, value)
    session.commit()
    session.refresh(data_info)
    return data_info


@router.get('/specialty', response_model=GetSpecialtyResponseSchema)
def get_specialty(limit: int = 10, offset: int = 0, search: Optional[str] = None, specialty_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Specialty)
    if specialty_id:
        query = query.where(Specialty.id == specialty_id)
    if search:
        query = query.filter(or_(*[getattr(Specialty, column).ilike(
            f"%{search}%"
        ) for column in Specialty.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/specialty/{id}')
def delete_specialty(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data = session.query(Specialty).get(id)
    if data:
        session.delete(data)
        session.commit()