from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy.orm import relationship


class Status(Base):
    __tablename__ = "status"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
    equipment_msp = relationship('EquipmentMsp', back_populates='status')
    masterplan = relationship('Masterplan', back_populates='status')
    schedule_queue = relationship('ScheduleQueue', back_populates='status')
    ot = relationship('Ot', back_populates='status')
    week = relationship('Week', back_populates='status')
    month = relationship('Month', back_populates='status')
