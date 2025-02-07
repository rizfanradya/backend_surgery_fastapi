from dotenv import load_dotenv
import os


load_dotenv()

MAX_FILE_SIZE_BYTES = 2 * 1024 * 1024  # 2mb
ACCESS_TOKEN_EXPIRE_MINUTES = 8 * 60  # 8 hours
REFRESH_TOKEN_EXPIRE_MINUTES = 60 * 24 * 7  # 7 days
ALGORITHM = "HS256"

JWT_SECRET_KEY = os.environ.get('JWT_SECRET_KEY')
JWT_REFRESH_SECRET_KEY = os.environ.get('JWT_REFRESH_SECRET_KEY')

IP_SERVER_HOSTNAME = os.environ.get('IP_SERVER_HOSTNAME')
SERVER_PORT = os.environ.get('SERVER_PORT')

EMAIL_USER: str = os.environ.get('EMAIL_USER')  # type: ignore
EMAIL_PASSWORD: str = os.environ.get('EMAIL_PASSWORD')  # type: ignore

DB_HOSTNAME = os.environ.get('DB_HOSTNAME')
DB_PORT = os.environ.get('DB_PORT')
DB_USER = os.environ.get('DB_USER')
DB_PASSWORD = os.environ.get('DB_PASSWORD')
DB_NAME = os.environ.get('DB_NAME')

LINK_FRONTEND = os.environ.get('LINK_FRONTEND')

REDIS_HOST = os.environ.get('REDIS_HOST')
REDIS_PORT = os.environ.get('REDIS_PORT')
REDIS_DB = os.environ.get('REDIS_DB')
REDIS_URL = f'redis://{REDIS_HOST}:{REDIS_PORT}/{REDIS_DB}'
