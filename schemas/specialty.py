from pydantic import BaseModel
from typing import List


class SpecialtySchema(BaseModel):
    name: str


class SpecialtyDataSchema(SpecialtySchema):
    id: int

    class Config:
        orm_mode = True


class GetSpecialtyResponseSchema(BaseModel):
    total_data: int
    data: List[SpecialtyDataSchema]

    class Config:
        orm_mode = True
