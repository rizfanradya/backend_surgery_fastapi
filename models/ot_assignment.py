from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer, Boolean, Time, String, Date
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class OtAssignment(Base):
    __tablename__ = "ot_assignment"

    id = Column(Integer, primary_key=True, index=True)
    mrn = Column(String(length=255), nullable=False)
    is_require_anaes = Column(Boolean, nullable=False)
    opening_time = Column(Time, nullable=False)
    closing_time = Column(Time, nullable=False)
    date = Column(Date, nullable=False)
    mssp_id = Column(Integer, ForeignKey('masterplan.id'), nullable=False)
    masterplan = relationship('Masterplan', back_populates='ot_assignment')
    ot_id = Column(Integer, ForeignKey('ot.id'), nullable=False)
    ot = relationship('Ot', back_populates='ot_assignment')
    unit_id = Column(Integer, ForeignKey('unit.id'), nullable=False)
    unit = relationship('Unit', back_populates='ot_assignment')
    week_id = Column(Integer, ForeignKey('week.id'), nullable=False)
    week = relationship('Week', back_populates='ot_assignment')
    day_id = Column(Integer, ForeignKey('day.id'), nullable=False)
    day = relationship('Day', back_populates='ot_assignment')
