from pydantic import BaseModel
from typing import List


class EquipmentRequirementSchema(BaseModel):
    unit_id: int
    equipment_id: int
    equipment_requirement_status_id: int


class EquipmentRequirementDataSchema(EquipmentRequirementSchema):
    id: int

    class Config:
        orm_mode = True


class GetEquipmentRequirementResponseSchema(BaseModel):
    total_data: int
    data: List[EquipmentRequirementDataSchema]

    class Config:
        orm_mode = True
