from pydantic import BaseModel
from typing import List


class BlockedDaySchema(BaseModel):
    day_id: int
    unit_id: int


class BaseSchema(BlockedDaySchema):
    id: int

    class Config:
        from_attributes = True


class BlockedDayResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
