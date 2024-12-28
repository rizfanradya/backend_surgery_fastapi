from pydantic import BaseModel
from typing import List


class ScheduleResourceSchema(BaseModel):
    resource: str
    value: int


class BaseSchema(ScheduleResourceSchema):
    id: int

    class Config:
        from_attributes = True


class ScheduleResourceResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
