from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from typing import Optional
from sqlalchemy import or_
from models.clashing_subspecialties import ClashingSubSpecialties
from schemas.clashing_subspecialties import ClashingSubSpecialtiesSchema, ClashingSubSpecialtiesResponseSchema

router = APIRouter()


@router.post('/clashing_subspecialties')
def create_clashing_subspecialties(clashing_subspecialties: ClashingSubSpecialtiesSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        new_data = ClashingSubSpecialties(**clashing_subspecialties.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    except Exception as error:
        send_error_response(str(error), 'day id or unit id not found')


@router.put('/clashing_subspecialties/{id}')
def update_clashing_subspecialties(id: int, clashing_subspecialties: ClashingSubSpecialtiesSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    data_info = session.query(ClashingSubSpecialties).get(id)
    if data_info is None:
        send_error_response('Data not found')
    try:
        for key, value in clashing_subspecialties.dict().items():
            if value is not None:
                setattr(data_info, key, value)
        session.commit()
        session.refresh(data_info)
        return data_info
    except Exception as error:
        send_error_response(str(error), 'day id or unit id not found')


@router.get('/clashing_subspecialties', response_model=ClashingSubSpecialtiesResponseSchema)
def get_clashing_subspecialties(limit: int = 10, offset: int = 0, search: Optional[str] = None, clashing_subspecialties_id: Optional[int] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(ClashingSubSpecialties)
    if clashing_subspecialties_id:
        query = query.where(ClashingSubSpecialties.id ==
                            clashing_subspecialties_id)
    if search:
        query = query.filter(or_(*[getattr(ClashingSubSpecialties, column).ilike(
            f"%{search}%"
            # type: ignore
        ) for column in ClashingSubSpecialties.__table__.columns.keys()]
        ))
    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/clashing_subspecialties/{id}')
def delete_clashing_subspecialties(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        data = session.query(ClashingSubSpecialties).get(id)
        if data:
            session.delete(data)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')
