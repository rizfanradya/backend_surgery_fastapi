from pydantic import BaseModel
from typing import List


class BlockedDaySchema(BaseModel):
    day_id: int
    unit_id: int


class BlockedDayDataSchema(BlockedDaySchema):
    id: int

    class Config:
        orm_mode = True


class GetBlockedDayResponseSchema(BaseModel):
    total_data: int
    data: List[BlockedDayDataSchema]

    class Config:
        orm_mode = True
