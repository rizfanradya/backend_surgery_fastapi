from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, DateTime, Text, Date
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
    downloaded_file = Column(String(length=255))
    start_date = Column(Date)
    end_date = Column(Date)
    log_usr = Column(Text)
    log_sys = Column(Text)
    task_id = Column(Text)
    masterplan_id = Column(Integer, ForeignKey(
        'masterplan.id'), nullable=False)
    masterplan = relationship('Masterplan', back_populates='schedule_queue')
    status_id = Column(Integer, ForeignKey('status.id'), nullable=False)
    status = relationship('Status', back_populates='schedule_queue')
    user_id = Column(Integer, ForeignKey('user.id'), nullable=False)
    user = relationship('User', back_populates='schedule_queue')
    schedule_results = relationship(
        'ScheduleResults', back_populates='schedule_queue')
