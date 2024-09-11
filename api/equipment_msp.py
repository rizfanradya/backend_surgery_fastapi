from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.equipment_msp import EquipmentMsp
from schemas.equipment_msp import EquipmentMspSchema, GetEquipmentMspResponseSchema

router = APIRouter()


@router.post('/equipment_msp')
def create_equipment_msp(equipment_msp: EquipmentMspSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = EquipmentMsp(**equipment_msp.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'status id not found')


@router.put('/equipment_msp/{id}')
def update_equipment_msp(id: int, equipment_msp: EquipmentMspSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(EquipmentMsp).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in equipment_msp.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'status id not found')


@router.get('/equipment_msp', response_model=GetEquipmentMspResponseSchema)
def get_equipment_msp(limit: int = 10, offset: int = 0, search: Optional[str] = None, equipment_msp_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(EquipmentMsp)
    if equipment_msp_id:
        query = query.where(EquipmentMsp.id == equipment_msp_id)
    if search:
        query = query.filter(or_(*[getattr(EquipmentMsp, column).ilike(
            f"%{search}%"
        ) for column in EquipmentMsp.__table__.columns.keys()]  # type: ignore
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/equipment_msp/{id}')
def delete_equipment_msp(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(EquipmentMsp).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
