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
    week_id = Column(Integer, ForeignKey('week.id'), nullable=False)
    week_day = Column(String(length=255), nullable=False)
    surgery_date = Column(Date, nullable=False)
    type_of_surgery = Column(Text, nullable=False)
    sub_specialty_desc = Column(Text, nullable=False)
    specialty_id = Column(Text, nullable=False)
    procedure_name = Column(Text, nullable=False)
    surgery_duration = Column(Integer, nullable=False)
    phu_id = Column(
        Integer,
        ForeignKey('ot_assignment.unit_id'),
        nullable=False
    )
    phu_start_time = Column(Time, nullable=False)
    phu_end_time = Column(Time, nullable=False)
    ot_id = Column(
        Integer,
        ForeignKey('ot_assignment.ot_id'),
        nullable=False
    )
    ot_start_time = Column(Time, nullable=False)
    ot_end_time = Column(Time, nullable=False)
    surgeon_name = Column(Text, nullable=False)
    post_op_id = Column(
        Integer,
        ForeignKey('ot_assignment.unit_id'),
        nullable=False
    )
    post_op_start_time = Column(Time, nullable=False)
    post_op_end_time = Column(Time, nullable=False)
    pacu_id = Column(
        Integer,
        ForeignKey('ot_assignment.unit_id'),
        nullable=False
    )
    pacu_start_time = Column(Time, nullable=False)
    pacu_end_time = Column(Time, nullable=False)
    icu_id = Column(
        Integer,
        ForeignKey('ot_assignment.unit_id'),
        nullable=False
    )
    icu_start_time = Column(Time, nullable=False)
    icu_end_time = Column(Time, nullable=False)
    week = relationship('Week', back_populates='schedule_results')
    phu = relationship(
        'OtAssignment',
        back_populates='phu_schedule_results',
        foreign_keys=[phu_id]
    )
    post_op = relationship(
        'OtAssignment',
        back_populates='post_op_schedule_results',
        foreign_keys=[post_op_id]
    )
    pacu = relationship(
        'OtAssignment',
        back_populates='pacu_schedule_results',
        foreign_keys=[pacu_id]
    )
    icu = relationship(
        'OtAssignment',
        back_populates='icu_schedule_results',
        foreign_keys=[icu_id]
    )
    ot = relationship(
        'OtAssignment',
        back_populates='ot_schedule_results',
        foreign_keys=[ot_id]
    )
