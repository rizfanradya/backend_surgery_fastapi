from fastapi.security import OAuth2PasswordRequestForm
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from models.user import User
from email.message import EmailMessage
import jwt
import bcrypt
import random
import smtplib
from utils.database import get_db
from utils.auth import create_access_token, create_refresh_token
from utils.error_response import send_error_response
from utils.config import (
    JWT_REFRESH_SECRET_KEY,
    ALGORITHM,
    JWT_SECRET_KEY,
    IP_SERVER_HOSTNAME,
    SERVER_PORT,
    EMAIL_PASSWORD,
    EMAIL_USER
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

            msg = EmailMessage()
            msg['subject'] = "HCTM Surgery Verification"
            msg['from'] = 'HCTM Surgery'
            msg['to'] = user_info.email
            msg.set_content('')
            msg.add_alternative(
                f"""\
                <!DOCTYPE html>
                <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Verifify email</title>
                        <script src="https://cdn.tailwindcss.com"></script>
                    </head>
                    <body>
                        <div class="flex flex-col items-center justify-center w-full gap-4 my-20 tracking-wide">
                            <h1 class="text-4xl font-bold">Verify Your Email</h1>
                            <p class="font-semibold text-md">Click link for verify your email</p>
                            <a href="http://{IP_SERVER_HOSTNAME}:{SERVER_PORT}/api/email_verify/{encode_otp}" target="_blank" class="px-8 py-2 font-bold text-white bg-blue-500 rounded-md">Verify Now</a>
                        </div>
                    </body>
                </html>
            """,
                subtype='html'
            )

            with smtplib.SMTP_SSL('smtp.gmail.com', 465)as smtp:
                smtp.login(EMAIL_USER, EMAIL_PASSWORD)
                smtp.send_message(msg)
            return {"detail": "verification sending"}
