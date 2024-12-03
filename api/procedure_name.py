from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from models.procedure_name import ProcedureName
from schemas.procedure_name import ProcedureNameSchema, ProcedureNameResponseSchema
from typing import Optional
from sqlalchemy import or_

router = APIRouter()


@router.post('/procedure_name')
def create_procedure_name(procedure_name: ProcedureNameSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = ProcedureName(**procedure_name.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'subspecialty id not found')


@router.put('/procedure_name/{id}')
def update_procedure_name(id: int, procedure_name: ProcedureNameSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(ProcedureName).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in procedure_name.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'subspecialty id not found')


@router.get('/procedure_name', response_model=ProcedureNameResponseSchema)
def get_procedure_name(limit: int = 10, offset: int = 0, search: Optional[str] = None, procedure_name_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(ProcedureName)
    if procedure_name_id:
        query = query.where(ProcedureName.id == procedure_name_id)
    if search:
        query = query.filter(or_(*[getattr(ProcedureName, column).ilike(
            f"%{search}%"
        ) for column in ProcedureName.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/procedure_name/{id}')
def delete_procedure_name(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(ProcedureName).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
