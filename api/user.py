from fastapi.security import OAuth2PasswordBearer
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from utils.hashed_password import hashed_password
from models.user import User
from schemas.user import UserSchema
from typing import Optional
from sqlalchemy import or_

router = APIRouter()


@router.post('/user')
def create_user(user: UserSchema, session: Session = Depends(get_db)):
    user.password = hashed_password(user.password)
    try:
        new_user_info = User(**user.dict())
        session.add(new_user_info)
        session.commit()
        session.refresh(new_user_info)
        return new_user_info
    except Exception as error:
        send_error_response(str(error), 'User already exists')


@router.put('/user/{id}')
def update_user(id: int, user: UserSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    user.password = hashed_password(user.password)
    try:
        user_info = session.query(User).get(id)
        if user_info is None:
            send_error_response('User not found')

        for key, value in user.dict().items():
            if value is not None:
                setattr(user_info, key, value)
        session.commit()
        session.refresh(user_info)
        return user_info
    except Exception as error:
        send_error_response(str(error), 'User already exists')


@router.get('/user')
def get_user(limit: int = 10, offset: int = 0, search: Optional[str] = None, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    query = session.query(User)

    if search:
        query = query.filter(or_(*[getattr(User, column).ilike(
            f"%{search}%"
        ) for column in User.__table__.columns.keys()]))  # type: ignore

    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore

    return {
        "total_data": total_data,
        "limit": limit,
        "offset": offset,
        "search": search,
        "data": query
    }


@router.get('/user/{id}')
def get_user_by_id(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return session.query(User).get(id)


@router.delete('/user/{id}')
def delete_user(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    user = session.query(User).get(id)
    if user:
        session.delete(user)
        session.commit()
