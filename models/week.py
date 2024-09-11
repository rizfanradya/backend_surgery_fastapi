from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class Week(Base):
    __tablename__ = "week"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    status_id = Column(Integer, ForeignKey('status.id'), nullable=False)
    status = relationship('Status', back_populates='week')
    day = relationship('Day', back_populates='week')
    ot_assignment = relationship('OtAssignment', back_populates='week')
    schedule_results = relationship('ScheduleResults', back_populates='week')
