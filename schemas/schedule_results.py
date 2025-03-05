from pydantic import BaseModel
from typing import List
from datetime import date, time


class ScheduleResultsSchema(BaseModel):
    run_id: str
    schedule_queue_id: int
    unit_id: int
    mrn: str
    age: int
    week_id: int
    mssp_week_id: int
    day_id: int
    month_id: int
    surgery_date: date
    type_of_surgery: str
    sub_specialty_desc: str
    specialty_id: str
    procedure_name: str
    surgery_duration: int
    phu_id: int
    phu_start_time: time
    phu_end_time: time
    ot_id: int
    ot_start_time: time
    ot_end_time: time
    surgeon_name: str
    booked_by: str
    post_op_id: int
    post_op_start_time: time
    post_op_end_time: time
    pacu_id: int
    pacu_start_time: time
    pacu_end_time: time
    icu_id: int
    icu_start_time: time
    icu_end_time: time


class BaseSchema(ScheduleResultsSchema):
    id: int

    class Config:
        from_attributes = True


class ScheduleResultsResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
