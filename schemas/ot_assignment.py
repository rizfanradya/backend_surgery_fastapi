from pydantic import BaseModel
from typing import List
from datetime import time, date


class OtAssignmentSchema(BaseModel):
    mssp_id: int
    mrn: str
    week_id: int
    week_number: int
    ot_id: int
    unit_id: int
    day_id: int
    date: date
    is_require_anaes: bool
    opening_time: time
    closing_time: time


class BaseSchema(OtAssignmentSchema):
    id: int

    class Config:
        from_attributes = True


class OtAssignmentResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
