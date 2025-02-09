from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from utils.hashed_password import hashed_password
from models.user import User
from schemas.user import UserSchema, UserResponseSchema, UserEmailNotification
from typing import Optional
from sqlalchemy import or_, cast, String

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
        send_error_response(
            str(error),
            'User already exists or role id not found'
        )


@router.put('/user/{id}')
def update_user(id: int, user: UserSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    user.password = hashed_password(user.password)
    user_info = session.query(User).get(id)
    if user_info is None:
        send_error_response('User not found')
    try:
        for key, value in user.dict().items():
            if value is not None:
                setattr(user_info, key, value)
        session.commit()
        session.refresh(user_info)
        return user_info
    except Exception as error:
        send_error_response(
            str(error),
            'User already exists or role id not found'
        )


@router.get('/user', response_model=UserResponseSchema)
def get_user(limit: int = 10, offset: int = 0, search: Optional[str] = None, user_id: Optional[int] = None, session: Session = Depends(get_db)):
    query = session.query(User)

    if user_id:
        query = query.where(User.id == user_id)

    if search:
        query = query.filter(or_(*[
            cast(getattr(User, column), String).ilike(f"%{search}%")
            if getattr(User, column).type.python_type == str
            else cast(getattr(User, column), String).ilike(f"%{search}%")
            for column in User.__table__.columns.keys()
        ]))

    total_data = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore

    return {
        "total_data": total_data,
        "data": query
    }


@router.delete('/user/{id}')
def delete_user(id: int, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        user = session.query(User).get(id)
        if user:
            session.delete(user)
            session.commit()
    except Exception as error:
        send_error_response(str(error), 'Cannot delete this data')


@router.post('/user/email_notification')
def email_notification(user: UserEmailNotification, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    user_info = session.query(User).get(user.id)
    if user_info is None:
        send_error_response('User not found')
    if token.id != user_info.id:
        send_error_response('User sessions are not the same')
    try:
        for key, value in user.dict().items():
            if value is not None:
                setattr(user_info, key, value)
        session.commit()
        session.refresh(user_info)
        return user_info
    except Exception as error:
        send_error_response(
            str(error),
            'Change Email Notification Failed'
        )
