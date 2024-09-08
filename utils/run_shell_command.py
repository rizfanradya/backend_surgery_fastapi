import os
import subprocess
import sys
from sqlalchemy import create_engine, inspect, text
import shutil
from .database import DATABASE_URL


def run_shell_commands():
    abs_path = os.path.abspath(__file__)
    path_dirname = os.path.dirname(abs_path)
    project_root = os.path.dirname(path_dirname)
    engine = create_engine(DATABASE_URL)

    if os.name == 'posix':  # Linux/macOS
        python_cmd = "python3"
    elif os.name == 'nt':  # Windows
        python_cmd = "python"
    else:
        raise EnvironmentError("Unsupported operating system")

    commands = []
    commands.extend([
        f"{python_cmd} -m pip install --upgrade pip",
        f"{python_cmd} -m pip install --no-cache-dir -r requirements.txt",
    ])

    versions_folder = os.path.join(project_root, 'alembic', 'versions')
    if not os.path.exists(versions_folder):
        os.makedirs(versions_folder)
    if os.path.exists(versions_folder):
        for filename in os.listdir(versions_folder):
            file_path = os.path.join(versions_folder, filename)
            try:
                if os.path.isfile(file_path) or os.path.islink(file_path):
                    os.unlink(file_path)
                elif os.path.isdir(file_path):
                    shutil.rmtree(file_path)
            except Exception as e:
                print(f"Failed to delete {file_path}. reason: {e}")

    inspector = inspect(engine)
    if 'alembic_version' in inspector.get_table_names():  # type: ignore
        with engine.connect() as connection:  # type: ignore
            connection.execute(text("TRUNCATE TABLE alembic_version"))

    commands.extend([
        f"{python_cmd} -m alembic revision --autogenerate -m 'rev'",
        f"{python_cmd} -m alembic upgrade head"
    ])

    original_cwd = os.getcwd()
    try:
        os.chdir(project_root)
        for command in commands:
            try:
                subprocess.run(command, shell=True, check=True)
            except subprocess.CalledProcessError as e:
                print(f"Command '{command}' failed with error: {e}")
                sys.exit(1)
    finally:
        os.chdir(original_cwd)
