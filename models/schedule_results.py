from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Text, Date, Time


class ScheduleResults(Base):
    __tablename__ = "schedule_results"

    id = Column(Integer, primary_key=True, index=True)
    run_id = Column(String(length=255), nullable=False)
    mrn = Column(Text, nullable=False)
    age = Column(Integer, nullable=False)
    week_id = Column(Integer, nullable=False)
    week_day = Column(String(length=255), nullable=False)
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
    post_op_id = Column(Integer, nullable=False)
    post_op_start_time = Column(Time, nullable=False)
    post_op_end_time = Column(Time, nullable=False)
    pacu_id = Column(Integer, nullable=False)
    pacu_start_time = Column(Time, nullable=False)
    pacu_end_time = Column(Time, nullable=False)
    icu_id = Column(Integer, nullable=False)
    icu_start_time = Column(Time, nullable=False)
    icu_end_time = Column(Time, nullable=False)
