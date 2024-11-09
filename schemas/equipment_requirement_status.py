from pydantic import BaseModel
from typing import List


class EquipmentRequirementStatusSchema(BaseModel):
    description: str
    penalty_value: int


class EquipmentRequirementStatusDataSchema(EquipmentRequirementStatusSchema):
    id: int

    class Config:
        from_attributes = True


class GetEquipmentRequirementStatusResponseSchema(BaseModel):
    total_data: int
    data: List[EquipmentRequirementStatusDataSchema]

    class Config:
        from_attributes = True
