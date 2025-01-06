from pydantic import BaseModel
from typing import List


class MonthSchema(BaseModel):
    name: str
    status_id: int


class BaseSchema(MonthSchema):
    id: int

    class Config:
        from_attributes = True


class MonthResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
