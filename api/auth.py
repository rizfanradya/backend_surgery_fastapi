from fastapi.security import OAuth2PasswordRequestForm
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from models.user import User
import jwt
import bcrypt
import random
from utils.database import get_db
from utils.auth import create_access_token, create_refresh_token
from utils.error_response import send_error_response
from utils.send_email_message import send_email
from utils.config import (
    JWT_REFRESH_SECRET_KEY,
    ALGORITHM,
    JWT_SECRET_KEY,
    LINK_FRONTEND
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
def email_verify(otp: str, session: Session = Depends(get_db)):
    try:
        decode = jwt.decode(jwt=otp, key=str(
            JWT_SECRET_KEY), algorithms=[ALGORITHM])
        id = decode.get('id')
        if id:
            user_info = session.query(User).get(id)
            if user_info.otp == decode.get(  # type: ignore
                    'verify_code'):
                user_info.is_active = True  # type: ignore
                user_info.otp = None  # type: ignore
                session.commit()
                return {"detail": "verify email success"}
        send_error_response("Code verification invalid")
    except Exception as error:
        send_error_response(error, "Code verification invalid")


@router.get("/email_otp/{id}")
async def email_otp(id: int, session: Session = Depends(get_db)):
    user_info = session.query(User).get(id)
    if user_info is None:
        send_error_response("User not found")
    while True:
        random_number = ''.join(
            str(random.randint(0, 9))
            for _ in range(6)
        )
        existing_otp = session.query(User).where(
            User.otp == random_number).first()
        if not existing_otp:
            user_info.otp = random_number
            user_info.is_active = False
            session.commit()
            session.refresh(user_info)

            encode_otp = jwt.encode(
                payload={'id': user_info.id, 'verify_code': random_number},
                key=str(JWT_SECRET_KEY),
                algorithm=ALGORITHM
            )

            message = f"""
                <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Email Verification</title>
                </head>
                <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; margin: 0;">
                    <div style="max-width: 600px; background: white; padding: 20px; border-radius: 5px; 
                                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); margin: auto;">
                        <h2 style="color: #333; text-align: center;">Verify Your Email</h2>
                        <p style="text-align: center; color: #555;">To complete your registration, please verify your email by clicking the button below:</p>
                        <div style="text-align: center; margin: 20px 0;">
                            <a href="{LINK_FRONTEND}/email_verify/{encode_otp}" 
                                style="display: inline-block; background-color: #007bff; color: white; 
                                        padding: 12px 24px; text-decoration: none; border-radius: 5px; 
                                        font-size: 16px; font-weight: bold;">
                                Verify Now
                            </a>
                        </div>
                        <p style="text-align: center; color: #777;">If you did not request this email, please ignore it.</p>
                    </div>
                </body>
                </html>
                """
            send_email(user_info.email, 'Verification', message)
            return {"detail": "verification sending"}
