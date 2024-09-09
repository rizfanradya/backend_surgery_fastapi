from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


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
    day = relationship('Day', back_populates='blocked_day')
    unit = relationship('Unit', back_populates='blocked_day')
