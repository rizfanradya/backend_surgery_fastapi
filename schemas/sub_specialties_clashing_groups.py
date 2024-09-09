from pydantic import BaseModel
from typing import List


class SubSpecialtiesClashingGroupsSchema(BaseModel):
    clashing_group_id: int
    sub_specialty_id: int


class SubSpecialtiesClashingGroupsDataSchema(SubSpecialtiesClashingGroupsSchema):
    id: int

    class Config:
        orm_mode = True


class GetSubSpecialtiesClashingGroupsResponseSchema(BaseModel):
    total_data: int
    data: List[SubSpecialtiesClashingGroupsDataSchema]

    class Config:
        orm_mode = True
