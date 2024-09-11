from pydantic import BaseModel
from typing import List
from datetime import date, time


class ScheduleResultsSchema(BaseModel):
    run_id: str
    mrn: str
    age: int
    week_id: int
    week_day: str
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
    post_op_id: int
    post_op_start_time: time
    post_op_end_time: time
    pacu_id: int
    pacu_start_time: time
    pacu_end_time: time
    icu_id: int
    icu_start_time: time
    icu_end_time: time


class ScheduleResultsDataSchema(ScheduleResultsSchema):
    id: int

    class Config:
        orm_mode = True


class GetScheduleResultsResponseSchema(BaseModel):
    total_data: int
    data: List[ScheduleResultsDataSchema]

    class Config:
        orm_mode = True
