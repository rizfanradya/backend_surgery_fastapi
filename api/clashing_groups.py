from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.clashing_groups import ClashingGroups
from schemas.clashing_groups import ClashingGroupsSchema, GetClashingGroupsResponseSchema
router = APIRouter()


@router.post('/clashing_groups')
def create_clashing_groups(clashing_groups: ClashingGroupsSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    new_data = ClashingGroups(**clashing_groups.dict())
    session.add(new_data)
    session.commit()
    session.refresh(new_data)
    return new_data


@router.put('/clashing_groups/{id}')
def update_clashing_groups(id: int, clashing_groups: ClashingGroupsSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(ClashingGroups).get(id)
    if data_info is None:
        send_error_response('Data not found')
    for key, value in clashing_groups.dict().items():
        if value is not None:
            setattr(data_info, key, value)
    session.commit()
    session.refresh(data_info)
    return data_info


@router.get('/clashing_groups', response_model=GetClashingGroupsResponseSchema)
def get_clashing_groups(limit: int = 10, offset: int = 0, search: Optional[str] = None, clashing_groups_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(ClashingGroups)
    if clashing_groups_id:
        query = query.where(ClashingGroups.id == clashing_groups_id)
    if search:
        query = query.filter(or_(*[getattr(ClashingGroups, column).ilike(
            f"%{search}%"
        ) for column in ClashingGroups.__table__.columns.keys()  # type: ignore
        ]))  # type: ignore
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/clashing_groups/{id}')
def delete_clashing_groups(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data = session.query(ClashingGroups).get(id)
    if data:
        session.delete(data)
        session.commit()