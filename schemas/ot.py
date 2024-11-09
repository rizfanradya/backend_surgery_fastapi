from pydantic import BaseModel
from typing import List


class OtSchema(BaseModel):
    name: str
    ot_type_id: int
    status_id: int


class OtDataSchema(OtSchema):
    id: int

    class Config:
        from_attributes = True


class GetOtResponseSchema(BaseModel):
    total_data: int
    data: List[OtDataSchema]

    class Config:
        from_attributes = True
