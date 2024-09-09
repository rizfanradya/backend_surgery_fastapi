from pydantic import BaseModel
from typing import List


class ClashingGroupsSchema(BaseModel):
    description: str


class ClashingGroupsDataSchema(ClashingGroupsSchema):
    id: int

    class Config:
        orm_mode = True


class GetClashingGroupsResponseSchema(BaseModel):
    total_data: int
    data: List[ClashingGroupsDataSchema]

    class Config:
        orm_mode = True
