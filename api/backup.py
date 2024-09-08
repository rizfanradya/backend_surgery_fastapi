from fastapi import APIRouter, Depends
from fastapi.responses import StreamingResponse
from utils.database import get_db
from sqlalchemy.orm import Session
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from datetime import datetime
import io
import subprocess
from utils.config import (
    DB_NAME,
    DB_PASSWORD,
    DB_USER
)

router = APIRouter()


@router.get('/database')
def database(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        command = f"mysqldump -u {DB_USER} -p{DB_PASSWORD} {DB_NAME}"
        process = subprocess.Popen(
            command,
            shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        stdout, stderr = process.communicate()

        if process.returncode != 0:
            raise RuntimeError(f"Backup command failed: {stderr}")
        output_io = io.StringIO(stdout)
        filename = datetime.now().strftime(f'dbdump_hctm_surgery_%Y-%B-%d_%H:%M:%S.sql')

        return StreamingResponse(
            output_io,
            media_type='application/sql',
            headers={"Content-Disposition": f"attachment; filename={filename}"}
        )
    except Exception as error:
        return send_error_response(str(error))
