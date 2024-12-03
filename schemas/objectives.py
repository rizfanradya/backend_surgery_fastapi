from pydantic import BaseModel
from typing import List
from decimal import Decimal


class ObjectivesSchema(BaseModel):
    objectives: str
    weight: Decimal


class BaseSchema(ObjectivesSchema):
    id: int

    class Config:
        from_attributes = True


class ObjectivesResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
