from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.sub_specialties_clashing_groups import SubSpecialtiesClashingGroups
from schemas.sub_specialties_clashing_groups import SubSpecialtiesClashingGroupsSchema, GetSubSpecialtiesClashingGroupsResponseSchema

router = APIRouter()


@router.post('/sub_specialties_clashing_groups')
def create_sub_specialties_clashing_groups(sub_specialties_clashing_groups: SubSpecialtiesClashingGroupsSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = SubSpecialtiesClashingGroups(
            **sub_specialties_clashing_groups.dict()
        )
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(
            str(error),
            'clashing group id or sub specialty id not found'
        )


@router.put('/sub_specialties_clashing_groups/{id}')
def update_sub_specialties_clashing_groups(id: int, sub_specialties_clashing_groups: SubSpecialtiesClashingGroupsSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(SubSpecialtiesClashingGroups).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in sub_specialties_clashing_groups.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(
            str(error),
            'clashing group id or sub specialty id not found'
        )


@router.get('/sub_specialties_clashing_groups', response_model=GetSubSpecialtiesClashingGroupsResponseSchema)
def get_sub_specialties_clashing_groups(limit: int = 10, offset: int = 0, search: Optional[str] = None, sub_specialties_clashing_groups_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(SubSpecialtiesClashingGroups)
    if sub_specialties_clashing_groups_id:
        query = query.where(
            SubSpecialtiesClashingGroups.id == sub_specialties_clashing_groups_id
        )
    if search:
        query = query.filter(or_(*[getattr(SubSpecialtiesClashingGroups, column).ilike(
            f"%{search}%"
        ) for column in SubSpecialtiesClashingGroups.__table__.columns.keys(  # type: ignore
        )]))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/sub_specialties_clashing_groups/{id}')
def delete_sub_specialties_clashing_groups(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data = session.query(SubSpecialtiesClashingGroups).get(id)
    if data:
        session.delete(data)
        session.commit()
