from pydantic import BaseModel
from typing import List


class DaySchema(BaseModel):
    name: str
    week_id: int


class DayDataSchema(DaySchema):
    id: int

    class Config:
        orm_mode = True


class GetDayResponseSchema(BaseModel):
    total_data: int
    data: List[DayDataSchema]

    class Config:
        orm_mode = True
