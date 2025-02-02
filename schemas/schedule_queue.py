from pydantic import BaseModel
from typing import List, Optional
from decimal import Decimal
from datetime import date
from .status import StatusSchema


class ScheduleQueueSchema(BaseModel):
    run_id: int


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
