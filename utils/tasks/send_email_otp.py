from utils.celery import celery
from utils.database import get_db_session
from utils.config import JWT_SECRET_KEY, ALGORITHM, LINK_FRONTEND
from utils.send_email_message import send_email
from models.user import User
import random
import jwt


@celery.task(bind=True, name="utils.tasks.send_email_otp")
def send_email_otp_task(self, user_id):
    with get_db_session() as session:
        try:
            user_info = session.query(User).get(user_id)
            if user_info is None:
                return {"status": "error", "message": f"User ID {user_id} not found"}
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
                        payload={
                            'id': user_info.id,
                            'verify_code': random_number
                        },
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
                    return {"status": "success", "message": f"verification {user_info.email} sending"}
        except Exception as error:
            return {"status": "error", "message": str(error)}
