from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_, cast, String
from models.role import Role
from schemas.role import RoleSchema, RoleResponseSchema

router = APIRouter()


@router.post('/role')
def create_role(role: RoleSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = Role(**role.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'role already exist')


@router.put('/role/{id}')
def update_role(id: int, role: RoleSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(Role).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in role.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'role already exist')


@router.get('/role', response_model=RoleResponseSchema)
def get_role(limit: int = 10, offset: int = 0, search: Optional[str] = None, role_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(Role)
    if role_id:
        query = query.where(Role.id == role_id)
    if search:
        query = query.filter(or_(*[
            cast(getattr(Role, column), String).ilike(f"%{search}%")
            if getattr(Role, column).type.python_type == str
            else cast(getattr(Role, column), String).ilike(f"%{search}%")
            for column in Role.__table__.columns.keys()
        ]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/role/{id}')
def delete_role(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(Role).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
