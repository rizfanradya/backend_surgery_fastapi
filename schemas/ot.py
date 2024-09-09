from pydantic import BaseModel
from typing import List


class OtSchema(BaseModel):
    name: str
    ot_type_id: int
    status_id: int


class OtDataSchema(OtSchema):
    id: int

    class Config:
        orm_mode = True


class GetOtResponseSchema(BaseModel):
    total_data: int
    data: List[OtDataSchema]

    class Config:
        orm_mode = True
