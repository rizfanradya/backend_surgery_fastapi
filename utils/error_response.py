from fastapi import HTTPException


def send_error_response(error, message=None):
    error_str = str(error)
    message_str = str(message)
    raise HTTPException(
        status_code=404,
        detail={
            "message": message_str if message else error_str,
            "error": error_str,
        }
    )
