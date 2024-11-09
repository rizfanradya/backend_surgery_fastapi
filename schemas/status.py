from pydantic import BaseModel
from typing import List


class StatusSchema(BaseModel):
    description: str


class StatusDataSchema(StatusSchema):
    id: int

    class Config:
        from_attributes = True


class GetStatusResponseSchema(BaseModel):
    total_data: int
    data: List[StatusDataSchema]

    class Config:
        from_attributes = True
