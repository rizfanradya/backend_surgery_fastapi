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

db_engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=db_engine)

Base = declarative_base()


def get_db():
    db = None
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()  # type: ignore
