from pydantic import BaseModel
from typing import List


class SubSpecialtiesClashingGroupsSchema(BaseModel):
    clashing_group_id: int
    sub_specialty_id: int


class BaseSchema(SubSpecialtiesClashingGroupsSchema):
    id: int

    class Config:
        from_attributes = True


class SubSpecialtiesClashingGroupsResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
