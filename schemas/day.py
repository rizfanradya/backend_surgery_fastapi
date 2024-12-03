from pydantic import BaseModel
from typing import List


class DaySchema(BaseModel):
    name: str
    week_id: int


class BaseSchema(DaySchema):
    id: int

    class Config:
        from_attributes = True


class DayResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
