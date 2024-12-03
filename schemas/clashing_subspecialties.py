from pydantic import BaseModel
from typing import List


class BaseSchema(BaseModel):
    clashing_groups_id: int
    unit_id: int


class ClashingSubSpecialtiesSchema(BaseSchema):
    id: int

    class Config:
        from_attributes = True


class ClashingSubSpecialtiesResponseSchema(BaseModel):
    total_data: int
    data: List[ClashingSubSpecialtiesSchema]

    class Config:
        from_attributes = True
