from pydantic import BaseModel
from typing import List
from datetime import time


class OtAssignmentSchema(BaseModel):
    mssp_id: int
    week_id: int
    ot_id: int
    unit_id: int
    day_id: int
    is_require_anaes: bool
    opening_time: time
    closing_time: time


class OtAssignmentDataSchema(OtAssignmentSchema):
    id: int

    class Config:
        orm_mode = True


class GetOtAssignmentResponseSchema(BaseModel):
    total_data: int
    data: List[OtAssignmentDataSchema]

    class Config:
        orm_mode = True
