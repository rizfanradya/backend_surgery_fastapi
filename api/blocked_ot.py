from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.blocked_ot import BlockedOt
from schemas.blocked_ot import BlockedOtSchema, BlockedOtResponseSchema

router = APIRouter()


@router.post('/blocked_ot')
def create_blocked_ot(blocked_ot: BlockedOtSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = BlockedOt(**blocked_ot.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'ot id or unit id not found')


@router.put('/blocked_ot/{id}')
def update_blocked_ot(id: int, blocked_ot: BlockedOtSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(BlockedOt).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in blocked_ot.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'ot id or unit id not found')


@router.get('/blocked_ot', response_model=BlockedOtResponseSchema)
def get_blocked_ot(limit: int = 10, offset: int = 0, search: Optional[str] = None, blocked_ot_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(BlockedOt)
    if blocked_ot_id:
        query = query.where(BlockedOt.id == blocked_ot_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(BlockedOt, column), String).ilike(f"%{search}%")
            if getattr(BlockedOt, column).type.python_type == str
            else cast(getattr(BlockedOt, column), String).ilike(f"%{search}%")
            for column in BlockedOt.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/blocked_ot/{id}')
def delete_blocked_ot(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(BlockedOt).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
