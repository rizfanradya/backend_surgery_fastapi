from pydantic import BaseModel
from typing import List
from .status import StatusSchema
from datetime import date


class ScheduleQueueSchema(BaseModel):
    run_id: str
    start_date: date
    end_date: date
    masterplan_id: int


class BaseSchema(ScheduleQueueSchema):
    id: int
    status: StatusSchema

    class Config:
        from_attributes = True


class ScheduleQueueResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
