from pydantic import BaseModel
from typing import List


class ClashingGroupsSchema(BaseModel):
    description: str


class ClashingGroupsDataSchema(ClashingGroupsSchema):
    id: int

    class Config:
        from_attributes = True


class GetClashingGroupsResponseSchema(BaseModel):
    total_data: int
    data: List[ClashingGroupsDataSchema]

    class Config:
        from_attributes = True
