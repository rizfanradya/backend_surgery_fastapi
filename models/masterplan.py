from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, DateTime, Numeric, Date, Text
from sqlalchemy.orm import relationship
from sqlalchemy import ForeignKey
import pytz
from datetime import datetime

WIB = pytz.timezone('Asia/Jakarta')


class Masterplan(Base):
    __tablename__ = "masterplan"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255))
    objective_value = Column(Numeric(precision=10, scale=2), nullable=False)
    created_at = Column(
        DateTime, default=lambda: datetime.now(WIB), nullable=False)
    uploaded_file = Column(String(length=255))
    start_date = Column(Date)
    end_date = Column(Date)
    log_usr = Column(Text)
    log_sys = Column(Text)
    task_id = Column(Text)
    user_id = Column(Integer, ForeignKey('user.id'), nullable=False)
    user = relationship('User', back_populates='masterplan')
    status_id = Column(Integer, ForeignKey('status.id'), nullable=False)
    status = relationship('Status', back_populates='masterplan')
    ot_assignment = relationship('OtAssignment', back_populates='masterplan')
    surgery = relationship('Surgery', back_populates='masterplan')
