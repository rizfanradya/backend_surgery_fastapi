import os
import subprocess
from datetime import datetime
from .config import DB_HOSTNAME, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER


def backup_database():
    MAX_BACKUPS = 5
    base_dir = os.path.dirname(os.path.abspath(__file__))
    backup_folder = os.path.join(base_dir, "..", "backups")
    os.makedirs(backup_folder, exist_ok=True)
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_file = os.path.join(backup_folder, f"backup_{timestamp}.sql")
    DBH = f"-h {DB_HOSTNAME}"
    DBPRT = f"-P {DB_PORT}"
    DBU = f"-u {DB_USER}"
    DBP = f"-p{DB_PASSWORD}"
    DBN = DB_NAME
    RSLT_FILE = f"--result-file={backup_file}"
    command = f"mysqldump {DBH} {DBPRT} {DBU} {DBP} {DBN} {RSLT_FILE}"
    try:
        subprocess.run(command, check=True, shell=True)
        print(f'Backup database success : {backup_file}')
    except subprocess.CalledProcessError as e:
        print(f"failed backup database: {e}")
    backup_files = sorted(
        [
            os.path.join(backup_folder, f) for f in os.listdir(backup_folder) if f.endswith(".sql")
        ],
        key=os.path.getmtime
    )
    if len(backup_files) > MAX_BACKUPS:
        old_backups = backup_files[:-MAX_BACKUPS]
        for old_backup in old_backups:
            try:
                os.remove(old_backup)
            except OSError as e:
                print(f"Error deleting file {old_backup}: {e}")
