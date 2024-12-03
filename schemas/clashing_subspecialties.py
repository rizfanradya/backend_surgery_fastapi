from pydantic import BaseModel
from typing import List


class ClashingSubSpecialtiesSchema(BaseModel):
    clashing_groups_id: int
    unit_id: int


class BaseSchema(ClashingSubSpecialtiesSchema):
    id: int

    class Config:
        from_attributes = True


class ClashingSubSpecialtiesResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
