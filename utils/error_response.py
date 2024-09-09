from fastapi import HTTPException


def send_error_response(error, message=None):
    raise HTTPException(
        status_code=404,
        detail={
            "message": message if message else error,
            "error": error,
        }
    )
