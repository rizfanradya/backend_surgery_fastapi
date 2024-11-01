from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, DateTime
from sqlalchemy.orm import relationship
import pytz
from datetime import datetime

WIB = pytz.timezone('Asia/Jakarta')


class Masterplan(Base):
    __tablename__ = "masterplan"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
    objective_value = Column(Integer, nullable=False)
    created_at = Column(
        DateTime, default=lambda: datetime.now(WIB), nullable=False)
    uploaded_file = Column(String(length=255))
    ot_assignment = relationship('OtAssignment', back_populates='masterplan')
