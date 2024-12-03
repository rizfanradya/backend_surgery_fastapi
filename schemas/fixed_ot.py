from pydantic import BaseModel
from typing import List


class FixedOtSchema(BaseModel):
    ot_id: int
    unit_id: int


class BaseSchema(FixedOtSchema):
    id: int

    class Config:
        from_attributes = True


class FixedOtResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
