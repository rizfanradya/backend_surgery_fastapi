from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer, Boolean, Time
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship
from .schedule_results import ScheduleResults


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
    phu_schedule_results = relationship(
        'ScheduleResults',
        back_populates='phu',
        foreign_keys=[ScheduleResults.phu_id]
    )
    post_op_schedule_results = relationship(
        'ScheduleResults',
        back_populates='post_op',
        foreign_keys=[ScheduleResults.post_op_id]
    )
    pacu_schedule_results = relationship(
        'ScheduleResults',
        back_populates='pacu',
        foreign_keys=[ScheduleResults.pacu_id]
    )
    icu_schedule_results = relationship(
        'ScheduleResults',
        back_populates='icu',
        foreign_keys=[ScheduleResults.icu_id]
    )
    ot_schedule_results = relationship(
        'ScheduleResults',
        back_populates='ot',
        foreign_keys=[ScheduleResults.ot_id]
    )
