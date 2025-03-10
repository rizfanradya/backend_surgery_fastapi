from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Text, Date, Time
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class ScheduleResults(Base):
    __tablename__ = "schedule_results"

    id = Column(Integer, primary_key=True, index=True)
    run_id = Column(String(length=255), nullable=False)
    mrn = Column(Text, nullable=False)
    age = Column(Integer, nullable=False)
    surgery_date = Column(Date, nullable=False)
    type_of_surgery = Column(Text, nullable=False)
    sub_specialty_desc = Column(Text, nullable=False)
    specialty_id = Column(Text, nullable=False)
    procedure_name = Column(Text, nullable=False)
    surgery_duration = Column(Integer, nullable=False)
    phu_id = Column(Integer, nullable=False)
    phu_start_time = Column(Time, nullable=False)
    phu_end_time = Column(Time, nullable=False)
    ot_id = Column(Integer, nullable=False)
    ot_start_time = Column(Time, nullable=False)
    ot_end_time = Column(Time, nullable=False)
    surgeon_name = Column(Text, nullable=False)
    booked_by = Column(Text)
    post_op_id = Column(Integer, nullable=False)
    post_op_start_time = Column(Time, nullable=False)
    post_op_end_time = Column(Time, nullable=False)
    pacu_id = Column(Integer, nullable=False)
    pacu_start_time = Column(Time, nullable=False)
    pacu_end_time = Column(Time, nullable=False)
    icu_id = Column(Integer, nullable=False)
    icu_start_time = Column(Time, nullable=False)
    icu_end_time = Column(Time, nullable=False)
    unit_id = Column(Integer, ForeignKey('unit.id'), nullable=False)
    unit = relationship('Unit', back_populates='schedule_results')
    week_id = Column(Integer, ForeignKey('week.id'), nullable=False)
    week = relationship(
        'Week', back_populates='schedule_results',
        foreign_keys=[week_id]
    )
    mssp_week_id = Column(Integer, ForeignKey('week.id'), nullable=False)
    mssp_week = relationship(
        'Week', back_populates='mssp_week_schedule_results',
        foreign_keys=[mssp_week_id]
    )
    day_id = Column(Integer, ForeignKey('day.id'), nullable=False)
    day = relationship('Day', back_populates='schedule_results')
    month_id = Column(Integer, ForeignKey('month.id'), nullable=False)
    month = relationship('Month', back_populates='schedule_results')
    schedule_queue_id = Column(Integer, ForeignKey(
        'schedule_queue.id'), nullable=False)
    schedule_queue = relationship(
        'ScheduleQueue', back_populates='schedule_results')
