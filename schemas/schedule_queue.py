from pydantic import BaseModel
from typing import List
from .status import StatusSchema


class ScheduleQueueSchema(BaseModel):
    run_id: str


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
