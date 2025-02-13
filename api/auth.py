from fastapi.security import OAuth2PasswordRequestForm
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from models.user import User
import jwt
import bcrypt
from utils.database import get_db
from utils.auth import create_access_token, create_refresh_token
from utils.error_response import send_error_response
from utils.auth import TokenAuthorizationNotEmail
from utils.tasks.send_email_otp import send_email_otp_task
from utils.config import (
    JWT_REFRESH_SECRET_KEY,
    ALGORITHM,
    JWT_SECRET_KEY,
)

router = APIRouter()


@router.post("/token")
async def user_login(form_data: OAuth2PasswordRequestForm = Depends(), session: Session = Depends(get_db)):
    user_info = session.query(User).where(
        User.email == form_data.username).first()
    if user_info is None:
        send_error_response("User not found")
    form_data_pwd = form_data.password.encode('utf-8')
    user_info_pwd = user_info.password.encode('utf-8')  # type: ignore
    bcrypt_checkpw = bcrypt.checkpw(form_data_pwd, user_info_pwd)
    access_token = create_access_token(user_info.id)  # type: ignore
    refresh_token = create_refresh_token(user_info.id)  # type: ignore
    if bcrypt_checkpw:
        return {
            "id": user_info.id,  # type: ignore
            "access_token": access_token,
            "refresh_token": refresh_token,
            "status": user_info.is_active,  # type: ignore
            "role": user_info.role.role,  # type: ignore
            "detail": "Login success"
        }
    else:
        raise HTTPException(
            status_code=404,
            detail={
                "id": user_info.id,  # type: ignore
                "access_token": None,
                "refresh_token": None,
                "status": False,
                "role": None,
                "detail": "Password not match"
            }
        )


@router.post("/refresh_token/{refresh_token}")
async def refresh_token(refresh_token: str, session: Session = Depends(get_db)):
    if JWT_REFRESH_SECRET_KEY is None:
        send_error_response("Environment variable JWT SECRET KEY not set")
    try:
        decode_token = jwt.decode(
            refresh_token,
            JWT_REFRESH_SECRET_KEY,  # type: ignore
            algorithms=[ALGORITHM]
        )
        user_info = session.query(User).get(decode_token.get('id'))
        if user_info is None:
            send_error_response("User not found")
        return {
            "access_token": create_access_token(user_info.id),  # type: ignore
            "refresh_token": create_refresh_token(user_info.id)  # type: ignore
        }
    except jwt.ExpiredSignatureError:
        send_error_response("Token has expired")
    except jwt.InvalidTokenError:
        send_error_response("Token is invalid")


@router.get("/email_verify/{otp}")
def email_verify(otp: str, session: Session = Depends(get_db), token: str = Depends(TokenAuthorizationNotEmail)):
    try:
        decode = jwt.decode(jwt=otp, key=str(
            JWT_SECRET_KEY), algorithms=[ALGORITHM])
        user_info = session.query(User).get(token.id)
        if user_info.otp == decode.get(  # type: ignore
                'verify_code'):
            user_info.is_active = True  # type: ignore
            user_info.otp = None  # type: ignore
            session.commit()
            return {"detail": "verify email success"}
        send_error_response("Code verification invalid")
    except Exception as error:
        send_error_response(error, "Code verification invalid")


@router.get("/email_otp")
async def email_otp(session: Session = Depends(get_db), token: str = Depends(TokenAuthorizationNotEmail)):
    user_info = session.query(User).get(token.id)
    if user_info is None:
        send_error_response("User not found")
    send_email_otp_task.apply_async(args=[token.id])
    return {"detail": "verification sending process"}
