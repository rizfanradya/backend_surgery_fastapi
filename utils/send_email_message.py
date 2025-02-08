from datetime import datetime
from email.message import EmailMessage
import smtplib
from .config import EMAIL_USER, EMAIL_PASSWORD, LINK_FRONTEND


def send_email(user_email: str, subject: str, message: str):
    msg = EmailMessage()
    msg['subject'] = f"HCTM Surgery {subject}"
    msg['from'] = 'HCTM Surgery'
    msg['to'] = user_email
    msg.set_content('')
    msg.add_alternative(
        f"""
        <!DOCTYPE html>
        <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Email Notification</title>
            </head>
            <body style="font-family: Arial, sans-serif; line-height: 1.6; background-color: #f4f4f4; margin: 0; padding: 20px;">
                <div style="max-width: 600px; background: white; padding: 20px; border-radius: 5px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); margin: auto;">
                    <h2 style="color: #333; text-align: center;">HCTM Surgery Notification</h2>
                    <div style="border-bottom: 2px solid #ddd; margin: 10px 0;"></div>
                    <p style="color: #555;">{message}</p>
                    <p style="text-align: center; margin-top: 20px;">
                        <strong>HCTM Surgery Team</strong>
                    </p>
                </div>
            </body>
        </html>
        """,
        subtype='html'
    )
    with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:
        smtp.login(EMAIL_USER, EMAIL_PASSWORD)
        smtp.send_message(msg)


def generate_failed_email(masterplan, message):
    return f"""
    <html>
    <body style="font-family: Arial, sans-serif; line-height: 1.5; color: #333;">
        <h2 style="color: red;">🚨 Generate Masterplan Failed</h2>
        <p>Dear {masterplan.user.first_name} {masterplan.user.last_name},</p>
        <p>Unfortunately, the generation of the masterplan has failed. Below are the details:</p>
        <ul>
            <li><strong>Masterplan ID:</strong> {masterplan.id}</li>
            <li><strong>Uploaded File:</strong> {masterplan.uploaded_file}</li>
            <li><strong>Status:</strong> Failed ❌</li>
            <li><strong>Error Message:</strong> {message}</li>
            <li><strong>Timestamp:</strong> {datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')}</li>
        </ul>
        <p>Please check the uploaded file or contact support for further assistance.</p>
        <p>Best regards,</p>
        <p><strong>Your System Team</strong></p>
    </body>
    </html>
    """


def generate_success_email(masterplan):
    return f"""
    <html>
    <body style="font-family: Arial, sans-serif; line-height: 1.5; color: #333; background-color: #f4f4f4; padding: 20px; margin: 0;">
        <div style="max-width: 600px; background: white; padding: 20px; border-radius: 5px; 
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); margin: auto;">
            <h2 style="color: green; text-align: center;">✅ Generate Masterplan Successful</h2>
            <p>Dear {masterplan.user.first_name} {masterplan.user.last_name},</p>
            <p>Your masterplan has been successfully generated. Below are the details:</p>
            <ul>
                <li><strong>Masterplan ID:</strong> {masterplan.id}</li>
                <li><strong>Uploaded File:</strong> {masterplan.uploaded_file}</li>
                <li><strong>Status:</strong> Completed ✅</li>
                <li><strong>Objective Value:</strong> {masterplan.objective_value}</li>
                <li><strong>Timestamp:</strong> {datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')}</li>
            </ul>
            <p style="text-align: center; margin: 20px 0;">
                <a href="{LINK_FRONTEND}/viewmasterplan/{masterplan.id}" 
                    style="display: inline-block; background-color: #007bff; color: white; 
                            padding: 12px 24px; text-decoration: none; border-radius: 5px; 
                            font-size: 16px; font-weight: bold;">
                    View Masterplan
                </a>
            </p>
            <p>You can now proceed with the next steps in your workflow.</p>
            <p>Best regards,</p>
            <p style="text-align: center; margin-top: 20px;"><strong>Your System Team</strong></p>
        </div>
    </body>
    </html>
    """
