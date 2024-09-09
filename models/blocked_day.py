from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey


class BlockedDay(Base):
    __tablename__ = "blocked_day"

    id = Column(Integer, primary_key=True, index=True)
    day_id = Column(
        Integer,
        ForeignKey('day.id'),
        nullable=False
    )
    unit_id = Column(
        Integer,
        ForeignKey('unit.id'),
        nullable=False
    )
