from pydantic import BaseModel
from typing import List


class ObjectivesSchema(BaseModel):
    objectives: str
    weight: int


class ObjectivesDataSchema(ObjectivesSchema):
    id: int

    class Config:
        from_attributes = True


class GetObjectivesResponseSchema(BaseModel):
    total_data: int
    data: List[ObjectivesDataSchema]

    class Config:
        from_attributes = True
