from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.surgery import Surgery
from schemas.surgery import SurgerySchema, SurgeryResponseSchema

router = APIRouter()


@router.post('/surgery')
def create_surgery(surgery: SurgerySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Surgery(**surgery.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(
            str(error),
            'unit id or procedure name id not found'
        )


@router.put('/surgery/{id}')
def update_surgery(id: int, surgery: SurgerySchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Surgery).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in surgery.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(
            str(error),
            'unit id or procedure name id not found'
        )


@router.get('/surgery', response_model=SurgeryResponseSchema)
def get_surgery(limit: int = 10, offset: int = 0, search: Optional[str] = None, surgery_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Surgery)
    if surgery_id:
        query = query.where(Surgery.id == surgery_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(Surgery, column), String).ilike(f"%{search}%")
            if getattr(Surgery, column).type.python_type == str
            else cast(getattr(Surgery, column), String).ilike(f"%{search}%")
            for column in Surgery.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/surgery/{id}')
def delete_surgery(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Surgery).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
