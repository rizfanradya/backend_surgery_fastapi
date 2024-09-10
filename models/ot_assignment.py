from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer, Boolean, Time
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class OtAssignment(Base):
    __tablename__ = "ot_assignment"

    id = Column(Integer, primary_key=True, index=True)
    mssp_id = Column(Integer, ForeignKey('masterplan.id'), nullable=False)
    week_id = Column(Integer, ForeignKey('week.id'), nullable=False)
    ot_id = Column(Integer, ForeignKey('ot.id'), nullable=False)
    unit_id = Column(Integer, ForeignKey('unit.id'), nullable=False)
    day_id = Column(Integer, ForeignKey('day.id'), nullable=False)
    is_require_anaes = Column(Boolean, nullable=False)
    opening_time = Column(Time, nullable=False)
    closing_time = Column(Time, nullable=False)
    masterplan = relationship('Masterplan', back_populates='ot_assignment')
    week = relationship('Week', back_populates='ot_assignment')
    ot = relationship('Ot', back_populates='ot_assignment')
    unit = relationship('Unit', back_populates='ot_assignment')
    day = relationship('Day', back_populates='ot_assignment')
