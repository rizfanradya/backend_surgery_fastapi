from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.ot_assignment import OtAssignment
from schemas.ot_assignment import OtAssignmentSchema, OtAssignmentResponseSchema
from typing import Optional
from sqlalchemy import or_

router = APIRouter()


@router.post('/ot_assignment')
def create_ot_assignment(ot_assignment: OtAssignmentSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = OtAssignment(**ot_assignment.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(
            str(error),
            'week id or masterplan id or ot id or unit id or day id not found'
        )


@router.put('/ot_assignment/{id}')
def update_ot_assignment(id: int, ot_assignment: OtAssignmentSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(OtAssignment).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in ot_assignment.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(
            str(error),
            'week id or masterplan id or ot id or unit id or day id not found'
        )


@router.get('/ot_assignment', response_model=OtAssignmentResponseSchema)
def get_ot_assignment(limit: int = 10, offset: int = 0, search: Optional[str] = None, ot_assignment_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(OtAssignment)
    if ot_assignment_id:
        query = query.where(OtAssignment.id == ot_assignment_id)
    if search:
        query = query.filter(or_(*[getattr(OtAssignment, column).ilike(
            f"%{search}%"
        ) for column in OtAssignment.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/ot_assignment/{id}')
def delete_ot_assignment(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(OtAssignment).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
