from pydantic import BaseModel
from typing import List


class SubSpecialtySchema(BaseModel):
    description: str
    specialty_id: int
    color_hex: str


class BaseSchema(SubSpecialtySchema):
    id: int

    class Config:
        from_attributes = True


class SubSpecialtyResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
