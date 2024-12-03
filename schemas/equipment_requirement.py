from pydantic import BaseModel
from typing import List


class EquipmentRequirementSchema(BaseModel):
    unit_id: int
    equipment_id: int
    equipment_requirement_status_id: int


class BaseSchema(EquipmentRequirementSchema):
    id: int

    class Config:
        from_attributes = True


class EquipmentRequirementResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
