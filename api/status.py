from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.status import Status
from schemas.status import StatusSchema, StatusResponseSchema

router = APIRouter()


@router.post('/status')
def create_status(status: StatusSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Status(**status.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'Cannot insert this data')


@router.put('/status/{id}')
def update_status(id: int, status: StatusSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Status).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in status.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'Cannot update this data')


@router.get('/status', response_model=StatusResponseSchema)
def get_status(limit: int = 10, offset: int = 0, search: Optional[str] = None, status_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Status)
    if status_id:
        query = query.where(Status.id == status_id)
    if search:
        query = query.filter(or_(*[getattr(Status, column).ilike(
            f"%{search}%"
        ) for column in Status.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/status/{id}')
def delete_status(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Status).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
