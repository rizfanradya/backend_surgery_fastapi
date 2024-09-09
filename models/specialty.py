from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey


class Specialty(Base):
    __tablename__ = "specialty"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
