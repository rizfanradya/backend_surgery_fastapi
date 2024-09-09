from pydantic import BaseModel
from typing import List


class OtTypeSchema(BaseModel):
    description: str


class OtTypeDataSchema(OtTypeSchema):
    id: int

    class Config:
        orm_mode = True


class GetOtTypeResponseSchema(BaseModel):
    total_data: int
    data: List[OtTypeDataSchema]

    class Config:
        orm_mode = True
