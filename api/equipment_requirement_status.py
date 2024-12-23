from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.equipment_requirement_status import EquipmentRequirementStatus
from schemas.equipment_requirement_status import EquipmentRequirementStatusSchema, EquipmentRequirementStatusResponseSchema

router = APIRouter()


@router.post('/equipment_requirement_status')
def create_equipment_requirement_status(equipment_requirement_status: EquipmentRequirementStatusSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = EquipmentRequirementStatus(
            **equipment_requirement_status.dict()
        )
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'Cannot insert this data')


@router.put('/equipment_requirement_status/{id}')
def update_equipment_requirement_status(id: int, equipment_requirement_status: EquipmentRequirementStatusSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(EquipmentRequirementStatus).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in equipment_requirement_status.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'Cannot update this data')


@router.get('/equipment_requirement_status', response_model=EquipmentRequirementStatusResponseSchema)
def get_equipment_requirement_status(limit: int = 10, offset: int = 0, search: Optional[str] = None, equipment_requirement_status_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(EquipmentRequirementStatus)
    if equipment_requirement_status_id:
        query = query.where(
            EquipmentRequirementStatus.id == equipment_requirement_status_id
        )
    if search:
        query = query.filter(or_(*[
            cast(
                getattr(EquipmentRequirementStatus, column), String).ilike(f"%{search}%")
            if getattr(EquipmentRequirementStatus, column).type.python_type == str
            else cast(getattr(EquipmentRequirementStatus, column), String).ilike(f"%{search}%")
            for column in EquipmentRequirementStatus.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/equipment_requirement_status/{id}')
def delete_equipment_requirement_status(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(EquipmentRequirementStatus).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
