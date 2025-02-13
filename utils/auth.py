from typing import Union, Any
from datetime import datetime, timedelta
import jwt
from sqlalchemy.orm import Session
from fastapi import Depends
from fastapi.security import OAuth2PasswordBearer
from .database import get_db
from models.user import User
from .error_response import send_error_response
from .config import (
    ACCESS_TOKEN_EXPIRE_MINUTES,
    REFRESH_TOKEN_EXPIRE_MINUTES,
    ALGORITHM,
    JWT_SECRET_KEY,
    JWT_REFRESH_SECRET_KEY
)

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="api/token")


def create_access_token(subject: Union[str, Any], expires_delta=None):
    if expires_delta is not None:
        expires_delta = datetime.utcnow() + expires_delta
    else:
        expires_delta = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)

    encoded_jwt = jwt.encode(
        payload={"exp": expires_delta, "id": str(subject)},
        key=str(JWT_SECRET_KEY),
        algorithm=ALGORITHM
    )
    return encoded_jwt


def create_refresh_token(subject: Union[str, Any], expires_delta=None):
    if expires_delta is not None:
        expires_delta = datetime.utcnow() + expires_delta
    else:
        expires_delta = datetime.utcnow() + timedelta(minutes=REFRESH_TOKEN_EXPIRE_MINUTES)

    encoded_jwt = jwt.encode(
        payload={"exp": expires_delta, "id": str(subject)},
        key=str(JWT_REFRESH_SECRET_KEY),
        algorithm=ALGORITHM
    )
    return encoded_jwt


def TokenAuthorization(token: str = Depends(oauth2_scheme), session: Session = Depends(get_db)):
    if JWT_SECRET_KEY is None:
        send_error_response("Environment variable JWT SECRET KEY not set")
    try:
        decode_token = jwt.decode(
            token, JWT_SECRET_KEY, algorithms=[ALGORITHM])  # type: ignore
        user_info = session.query(User).get(decode_token.get('id'))
        if user_info is None:
            send_error_response("User not found")
        if user_info.is_active == False:
            send_error_response("Your email has not been verified")
        return user_info
    except jwt.ExpiredSignatureError:
        send_error_response("Token has expired")
    except jwt.InvalidTokenError:
        send_error_response("Token is invalid")


def TokenAuthorizationNotEmail(token: str = Depends(oauth2_scheme), session: Session = Depends(get_db)):
    if JWT_SECRET_KEY is None:
        send_error_response("Environment variable JWT SECRET KEY not set")
    try:
        decode_token = jwt.decode(
            token, JWT_SECRET_KEY, algorithms=[ALGORITHM])  # type: ignore
        user_info = session.query(User).get(decode_token.get('id'))
        if user_info is None:
            send_error_response("User not found")
        return user_info
    except jwt.ExpiredSignatureError:
        send_error_response("Token has expired")
    except jwt.InvalidTokenError:
        send_error_response("Token is invalid")
