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
import os
import subprocess
from utils.config import (
    DB_NAME,
    DB_PASSWORD,
    DB_USER,
    DB_PORT,
    DB_HOSTNAME
)

router = APIRouter()


@router.get('/backup_db')
def backup_database(token: str = Depends(TokenAuthorization)):
    try:
        os.environ['PGPASSWORD'] = str(DB_PASSWORD)

        command = [
            'pg_dump',
            '-U', DB_USER,
            '-h', DB_HOSTNAME,
            '-p', str(DB_PORT),
            '-d', DB_NAME,
            '--no-owner',
            '--no-acl'
        ]

        process = subprocess.Popen(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        stdout, stderr = process.communicate()

        del os.environ['PGPASSWORD']
        if process.returncode != 0:
            raise RuntimeError(f"Backup command failed: {stderr}")
        output_io = io.StringIO(stdout)
        filename = datetime.now().strftime(
            f'backup_{DB_NAME}_%Y-%m-%d_%H-%M-%S.sql')

        return StreamingResponse(
            output_io,
            media_type='application/sql',
            headers={"Content-Disposition": f"attachment; filename={filename}"}
        )
    except Exception as error:
        os.environ.pop('PGPASSWORD', None)
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
        for table in truncate_tables:
            session.execute(text(f'ALTER TABLE {table} DISABLE TRIGGER ALL'))
        for table in truncate_tables:
            session.execute(
                text(f'TRUNCATE TABLE {table} RESTART IDENTITY CASCADE'))
        for table in truncate_tables:
            session.execute(text(f'ALTER TABLE {table} ENABLE TRIGGER ALL'))
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
            'equipment_requirement',
            'clashing_subspecialties',
        ]
        for table in truncate_tables:
            session.execute(text(f'ALTER TABLE {table} DISABLE TRIGGER ALL'))
        for table in truncate_tables:
            session.execute(
                text(f'TRUNCATE TABLE {table} RESTART IDENTITY CASCADE'))
        for table in truncate_tables:
            session.execute(text(f'ALTER TABLE {table} ENABLE TRIGGER ALL'))
        session.commit()
        check_and_remove_orphaned_files()
        return {'message': 'Constraints tables truncated successfully'}
    except Exception as error:
        return send_error_response(str(error))
