from pydantic import BaseModel
from typing import List


class UnitSchema(BaseModel):
    name: str
    sub_specialty_id: int
    is_require_anaes: bool
    max_slot_limit: int
    no_of_slots: int
    resource_requirement_id: int
    color_hex: str


class BaseSchema(UnitSchema):
    id: int

    class Config:
        from_attributes = True


class UnitResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
