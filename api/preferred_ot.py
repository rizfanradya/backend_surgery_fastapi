from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.preferred_ot import PreferredOt
from schemas.preferred_ot import PreferredOtSchema, GetPreferredOtResponseSchema

router = APIRouter()


@router.post('/preferred_ot')
def create_preferred_ot(preferred_ot: PreferredOtSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = PreferredOt(**preferred_ot.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'ot id or unit id not found')


@router.put('/preferred_ot/{id}')
def update_preferred_ot(id: int, preferred_ot: PreferredOtSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(PreferredOt).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in preferred_ot.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'ot id or unit id not found')


@router.get('/preferred_ot', response_model=GetPreferredOtResponseSchema)
def get_preferred_ot(limit: int = 10, offset: int = 0, search: Optional[str] = None, preferred_ot_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(PreferredOt)
    if preferred_ot_id:
        query = query.where(PreferredOt.id == preferred_ot_id)
    if search:
        query = query.filter(or_(*[getattr(PreferredOt, column).ilike(
            f"%{search}%"
        ) for column in PreferredOt.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/preferred_ot/{id}')
def delete_preferred_ot(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(PreferredOt).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
