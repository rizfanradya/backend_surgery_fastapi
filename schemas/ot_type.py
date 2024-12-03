from pydantic import BaseModel
from typing import List


class OtTypeSchema(BaseModel):
    description: str


class BaseSchema(OtTypeSchema):
    id: int

    class Config:
        from_attributes = True


class OtTypeResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
