from pydantic import BaseModel
from typing import List


class BlockedOtSchema(BaseModel):
    ot_id: int
    unit_id: int


class BaseSchema(BlockedOtSchema):
    id: int

    class Config:
        from_attributes = True


class BlockedOtResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
