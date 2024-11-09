from pydantic import BaseModel
from typing import List
from datetime import datetime


class WeekSchema(BaseModel):
    name: str
    status_id: int


class WeekDataSchema(WeekSchema):
    id: int

    class Config:
        from_attributes = True


class GetWeekResponseSchema(BaseModel):
    total_data: int
    data: List[WeekDataSchema]

    class Config:
        from_attributes = True
