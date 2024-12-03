from pydantic import BaseModel
from typing import List


class StatusSchema(BaseModel):
    description: str


class BaseSchema(StatusSchema):
    id: int

    class Config:
        from_attributes = True


class StatusResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
