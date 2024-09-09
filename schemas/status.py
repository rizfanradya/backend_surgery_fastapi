from pydantic import BaseModel
from typing import List


class StatusSchema(BaseModel):
    description: str


class StatusDataSchema(StatusSchema):
    id: int

    class Config:
        orm_mode = True


class GetStatusResponseSchema(BaseModel):
    total_data: int
    data: List[StatusDataSchema]

    class Config:
        orm_mode = True
