from fastapi import APIRouter, Depends
from fastapi.responses import StreamingResponse
from utils.database import get_db
from sqlalchemy.orm import Session
from sqlalchemy import text
from utils.auth import TokenAuthorization
from utils.error_response import send_error_response
from utils.remove_orphaned_files import check_and_remove_orphaned_files
from datetime import datetime
import io
import subprocess
from utils.config import (
    DB_NAME,
    DB_PASSWORD,
    DB_USER
)

router = APIRouter()


@router.get('/backup_db')
def backup_database(token: str = Depends(TokenAuthorization)):
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


@router.get('/truncate_master_tables')
def truncate_master_tables(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        truncate_tables = [
            'masterplan',
            'ot_assignment',
            'surgery',
            'schedule_results',
        ]
        session.execute(text('SET FOREIGN_KEY_CHECKS = 0;'))
        for table in truncate_tables:
            session.execute(text(f'TRUNCATE TABLE {table}'))
        session.execute(text('SET FOREIGN_KEY_CHECKS = 1;'))
        session.commit()
        check_and_remove_orphaned_files()
        return {'message': 'Master tables truncated successfully'}
    except Exception as error:
        return send_error_response(str(error))


@router.get('/truncate_constraints')
def truncate_constraints(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    try:
        truncate_tables = [
            'blocked_day',
            'blocked_ot',
            'fixed_ot',
            'preferred_ot',
            'sub_specialties_clashing_groups',
            'equipment_requirement',
            'clashing_groups',
            'clashing_subspecialties',
        ]
        session.execute(text('SET FOREIGN_KEY_CHECKS = 0;'))
        for table in truncate_tables:
            session.execute(text(f'TRUNCATE TABLE {table}'))
        session.execute(text('SET FOREIGN_KEY_CHECKS = 1;'))
        session.commit()
        check_and_remove_orphaned_files()
        return {'message': 'Constraints tables truncated successfully'}
    except Exception as error:
        return send_error_response(str(error))
