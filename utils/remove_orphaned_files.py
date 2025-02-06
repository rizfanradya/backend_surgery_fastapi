import os
from .database import SessionLocal
from models.masterplan import Masterplan
from models.schedule_queue import ScheduleQueue


def check_and_remove_orphaned_files():
    session = SessionLocal()
    abs_path = os.path.abspath(__file__)
    base_dir = os.path.dirname(os.path.dirname(abs_path))

    # Check and remove orphaned files in Masterplan data
    data_in_db = [file[0] for file in session.query(Masterplan.uploaded_file).where(
        Masterplan.uploaded_file.isnot(None)).all()]
    directory = os.path.join(base_dir, 'uploads')
    os.makedirs(directory, exist_ok=True)
    files_delete = [
        f for f in os.listdir(directory) if f not in data_in_db
    ]
    for file_name in files_delete:
        file_path = os.path.join(directory, file_name)
        if os.path.isfile(file_path):
            os.remove(file_path)

    # Check and remove orphaned files in Schedule Queue data
    data_in_db = [file[0] for file in session.query(ScheduleQueue.uploaded_file).where(
        ScheduleQueue.uploaded_file.isnot(None)).all()]
    directory = os.path.join(base_dir, 'uploads', 'daily_schedule')
    os.makedirs(directory, exist_ok=True)
    files_delete = [
        f for f in os.listdir(directory) if f not in data_in_db
    ]
    for file_name in files_delete:
        file_path = os.path.join(directory, file_name)
        if os.path.isfile(file_path):
            os.remove(file_path)
