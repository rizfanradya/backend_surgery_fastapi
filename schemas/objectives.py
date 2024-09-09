from pydantic import BaseModel
from typing import List


class ObjectivesSchema(BaseModel):
    objectives: str
    weight: int


class ObjectivesDataSchema(ObjectivesSchema):
    id: int

    class Config:
        orm_mode = True


class GetObjectivesResponseSchema(BaseModel):
    total_data: int
    data: List[ObjectivesDataSchema]

    class Config:
        orm_mode = True
