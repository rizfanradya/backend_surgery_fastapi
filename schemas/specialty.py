from pydantic import BaseModel
from typing import List


class SpecialtySchema(BaseModel):
    name: str


class BaseSchema(SpecialtySchema):
    id: int

    class Config:
        from_attributes = True


class SpecialtyResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
