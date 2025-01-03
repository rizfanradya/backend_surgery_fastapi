from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.masterplan import Masterplan
from models.ot_assignment import OtAssignment
from schemas.masterplan import MasterPlanSchema, MasterPlanResponseSchema
import os

router = APIRouter()


@router.post('/masterplan')
def create_masterplan(masterplan: MasterPlanSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Masterplan(**masterplan.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'Cannot insert this data')


@router.put('/masterplan/{id}')
def update_masterplan(id: int, masterplan: MasterPlanSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Masterplan).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in masterplan.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'Cannot update this data')


@router.get('/masterplan', response_model=MasterPlanResponseSchema)
def get_masterplan(limit: int = 10, offset: int = 0, search: Optional[str] = None, masterplan_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Masterplan)
    if masterplan_id:
        query = query.where(Masterplan.id == masterplan_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(Masterplan, column), String).ilike(f"%{search}%")
            if getattr(Masterplan, column).type.python_type == str
            else cast(getattr(Masterplan, column), String).ilike(f"%{search}%")
            for column in Masterplan.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/masterplan/{id}')
def delete_masterplan(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Masterplan).get(id)
        ota_data = session.query(OtAssignment).where(
            OtAssignment.mssp_id == id).all()
        if data:
            for ota in ota_data:
                session.delete(ota)
            session.delete(data)
            session.commit()
            if data.uploaded_file is not None:
                abs_path = os.path.abspath(__file__)
                base_dir = os.path.dirname(os.path.dirname(abs_path))
                upload_dir = os.path.join(base_dir, 'uploads')
                os.makedirs(upload_dir, exist_ok=True)
                file_path = os.path.join(upload_dir, data.uploaded_file)
                if os.path.exists(file_path):
                    os.remove(file_path)
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
