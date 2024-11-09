from pydantic import BaseModel
from typing import List


class SubSpecialtySchema(BaseModel):
    description: str
    specialty_id: int
    color_hex: str


class SubSpecialtyDataSchema(SubSpecialtySchema):
    id: int

    class Config:
        from_attributes = True


class GetSubSpecialtyResponseSchema(BaseModel):
    total_data: int
    data: List[SubSpecialtyDataSchema]

    class Config:
        from_attributes = True
