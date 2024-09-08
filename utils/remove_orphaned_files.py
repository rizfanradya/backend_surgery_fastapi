import os
from models.user import User
from .database import SessionLocal


def check_and_remove_orphaned_files():
    session = SessionLocal()
    abs_path = os.path.abspath(__file__)
    base_dir = os.path.dirname(abs_path)

    # Check and remove orphaned files in user data
    data_in_user = [file[0] for file in session.query(User.file).where(
        User.file.isnot(None)).all()]
    directory_user = os.path.join(base_dir, 'uploads', 'member')
    os.makedirs(directory_user, exist_ok=True)
    files_user_delete = [
        f for f in os.listdir(directory_user) if f not in data_in_user
    ]
    for file_name in files_user_delete:
        file_path = os.path.join(directory_user, file_name)
        if os.path.isfile(file_path):
            os.remove(file_path)
