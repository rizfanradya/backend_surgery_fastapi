from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey


class SubSpecialty(Base):
    __tablename__ = "sub_specialty"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
    specialty_id = Column(Integer, ForeignKey('specialty.id'), nullable=False)
    color_hex = Column(String(length=7), nullable=False)
