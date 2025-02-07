from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, DateTime, Text
from sqlalchemy.orm import relationship
from sqlalchemy import ForeignKey
import pytz
from datetime import datetime

WIB = pytz.timezone('Asia/Jakarta')


class ScheduleQueue(Base):
    __tablename__ = "schedule_queue"

    id = Column(Integer, primary_key=True, index=True)
    run_id = Column(String(length=255), nullable=False)
    created_at = Column(
        DateTime, default=lambda: datetime.now(WIB), nullable=False)
    uploaded_file = Column(String(length=255))
    log_info = Column(Text)
    status_id = Column(Integer, ForeignKey('status.id'), nullable=False)
    status = relationship('Status', back_populates='schedule_queue')
    schedule_results = relationship(
        'ScheduleResults', back_populates='schedule_queue')
