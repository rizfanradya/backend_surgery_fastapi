from pydantic import BaseModel
from typing import List


class BlockedOtSchema(BaseModel):
    ot_id: int
    unit_id: int


class BlockedOtDataSchema(BlockedOtSchema):
    id: int

    class Config:
        orm_mode = True


class GetBlockedOtResponseSchema(BaseModel):
    total_data: int
    data: List[BlockedOtDataSchema]

    class Config:
        orm_mode = True
