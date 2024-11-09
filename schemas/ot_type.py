from pydantic import BaseModel
from typing import List


class OtTypeSchema(BaseModel):
    description: str


class OtTypeDataSchema(OtTypeSchema):
    id: int

    class Config:
        from_attributes = True


class GetOtTypeResponseSchema(BaseModel):
    total_data: int
    data: List[OtTypeDataSchema]

    class Config:
        from_attributes = True
