from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.equipment import Equipment
from schemas.equipment import EquipmentSchema, EquipmentResponseSchema
router = APIRouter()


@router.post('/equipment')
def create_equipment(equipment: EquipmentSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Equipment(**equipment.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'sub specialty id not found')


@router.put('/equipment/{id}')
def update_equipment(id: int, equipment: EquipmentSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Equipment).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in equipment.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'sub specialty id not found')


@router.get('/equipment', response_model=EquipmentResponseSchema)
def get_equipment(limit: int = 10, offset: int = 0, search: Optional[str] = None, equipment_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Equipment)
    if equipment_id:
        query = query.where(Equipment.id == equipment_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(Equipment, column), String).ilike(f"%{search}%")
            if getattr(Equipment, column).type.python_type == str
            else cast(getattr(Equipment, column), String).ilike(f"%{search}%")
            for column in Equipment.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/equipment/{id}')
def delete_equipment(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Equipment).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
