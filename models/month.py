from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class Month(Base):
    __tablename__ = "month"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    status_id = Column(Integer, ForeignKey('status.id'), nullable=False)
    status = relationship('Status', back_populates='month')
    schedule_results = relationship('ScheduleResults', back_populates='month')
