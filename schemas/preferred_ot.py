from pydantic import BaseModel
from typing import List


class PreferredOtSchema(BaseModel):
    ot_id: int
    unit_id: int


class BaseSchema(PreferredOtSchema):
    id: int

    class Config:
        from_attributes = True


class PreferredOtResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
