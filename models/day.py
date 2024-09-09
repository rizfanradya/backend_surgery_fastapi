from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey


class Day(Base):
    __tablename__ = "day"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    week_id = Column(Integer, ForeignKey('week.id'), nullable=False)
