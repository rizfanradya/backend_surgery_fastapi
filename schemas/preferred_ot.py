from pydantic import BaseModel
from typing import List


class PreferredOtSchema(BaseModel):
    ot_id: int
    unit_id: int


class PreferredOtDataSchema(PreferredOtSchema):
    id: int

    class Config:
        orm_mode = True


class GetPreferredOtResponseSchema(BaseModel):
    total_data: int
    data: List[PreferredOtDataSchema]

    class Config:
        orm_mode = True
