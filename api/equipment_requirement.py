from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.equipment_requirement import EquipmentRequirement
from schemas.equipment_requirement import EquipmentRequirementSchema, GetEquipmentRequirementResponseSchema

router = APIRouter()


@router.post('/equipment_requirement')
def create_equipment_requirement(equipment_requirement: EquipmentRequirementSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = EquipmentRequirement(**equipment_requirement.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(
            str(error),
            'unit id or equipment id or equipment requirement status id not found'
        )


@router.put('/equipment_requirement/{id}')
def update_equipment_requirement(id: int, equipment_requirement: EquipmentRequirementSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(EquipmentRequirement).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in equipment_requirement.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(
            str(error),
            'unit id or equipment id or equipment requirement status id not found'
        )


@router.get('/equipment_requirement', response_model=GetEquipmentRequirementResponseSchema)
def get_equipment_requirement(limit: int = 10, offset: int = 0, search: Optional[str] = None, equipment_requirement_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(EquipmentRequirement)
    if equipment_requirement_id:
        query = query.where(EquipmentRequirement.id ==
                            equipment_requirement_id)
    if search:
        query = query.filter(or_(*[getattr(EquipmentRequirement, column).ilike(
            f"%{search}%"
        ) for column in EquipmentRequirement.__table__.columns.keys(  # type: ignore
        )]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/equipment_requirement/{id}')
def delete_equipment_requirement(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(EquipmentRequirement).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
