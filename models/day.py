from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class Day(Base):
    __tablename__ = "day"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    week_id = Column(Integer, ForeignKey('week.id'), nullable=False)
    week = relationship('Week', back_populates='day')
    blocked_day = relationship('BlockedDay', back_populates='day')
    ot_assignment = relationship('OtAssignment', back_populates='day')
    schedule_results = relationship('ScheduleResults', back_populates='day')
