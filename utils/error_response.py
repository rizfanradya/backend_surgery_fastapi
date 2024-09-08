from fastapi import HTTPException
from typing import Optional


def send_error_response(error: str, message: Optional[str] = None):
    raise HTTPException(
        status_code=404,
        detail={
            "message": message or error,
            "error": error,
        }
    )
