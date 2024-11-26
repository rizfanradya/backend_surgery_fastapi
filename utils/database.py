from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from .config import (
    DB_HOSTNAME as DBH,
    DB_NAME as DBN,
    DB_PASSWORD as DBP,
    DB_PORT as DBPRT,
    DB_USER as DBU
)


DATABASE_URL = f"mysql://{DBU}:{DBP}@{DBH}:{DBPRT}/{DBN}"

db_engine = create_engine(
    DATABASE_URL,
    pool_size=10,
    max_overflow=20,
    pool_timeout=60,
    pool_recycle=1800,
    pool_pre_ping=True
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=db_engine)

Base = declarative_base()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()  # type: ignore
