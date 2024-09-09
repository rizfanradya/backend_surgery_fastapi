from pydantic import BaseModel
from typing import List


class FixedOtSchema(BaseModel):
    ot_id: int
    unit_id: int


class FixedOtDataSchema(FixedOtSchema):
    id: int

    class Config:
        orm_mode = True


class GetFixedOtResponseSchema(BaseModel):
    total_data: int
    data: List[FixedOtDataSchema]

    class Config:
        orm_mode = True
