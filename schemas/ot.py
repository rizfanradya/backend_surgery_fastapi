from pydantic import BaseModel
from typing import List


class OtSchema(BaseModel):
    name: str
    ot_type_id: int
    status_id: int


class BaseSchema(OtSchema):
    id: int

    class Config:
        from_attributes = True


class OtResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
