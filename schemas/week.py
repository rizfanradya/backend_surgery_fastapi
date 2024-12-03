from pydantic import BaseModel
from typing import List
from datetime import datetime


class WeekSchema(BaseModel):
    name: str
    status_id: int


class BaseSchema(WeekSchema):
    id: int

    class Config:
        from_attributes = True


class WeekResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
