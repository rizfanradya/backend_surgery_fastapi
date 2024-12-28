from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.schedule_resource import ScheduleResource
from schemas.schedule_resource import ScheduleResourceSchema, ScheduleResourceResponseSchema

router = APIRouter()


@router.post('/schedule_resource')
def create_schedule_resource(schedule_resource: ScheduleResourceSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = ScheduleResource(**schedule_resource.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'day id or unit id not found')


@router.put('/schedule_resource/{id}')
def update_schedule_resource(id: int, schedule_resource: ScheduleResourceSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(ScheduleResource).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in schedule_resource.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'day id or unit id not found')


@router.get('/schedule_resource', response_model=ScheduleResourceResponseSchema)
def get_schedule_resource(limit: int = 10, offset: int = 0, search: Optional[str] = None, schedule_resource_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(ScheduleResource)
    if schedule_resource_id:
        query = query.where(ScheduleResource.id == schedule_resource_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(ScheduleResource, column),
                 String).ilike(f"%{search}%")
            if getattr(ScheduleResource, column).type.python_type == str
            else cast(getattr(ScheduleResource, column), String).ilike(f"%{search}%")
            for column in ScheduleResource.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/schedule_resource/{id}')
def delete_schedule_resource(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(ScheduleResource).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
