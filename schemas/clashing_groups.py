from pydantic import BaseModel
from typing import List


class ClashingGroupsSchema(BaseModel):
    description: str


class BaseSchema(ClashingGroupsSchema):
    id: int

    class Config:
        from_attributes = True


class ClashingGroupsResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
