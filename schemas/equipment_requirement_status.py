from pydantic import BaseModel
from typing import List


class EquipmentRequirementStatusSchema(BaseModel):
    description: str
    penalty_value: int


class BaseSchema(EquipmentRequirementStatusSchema):
    id: int

    class Config:
        from_attributes = True


class EquipmentRequirementStatusResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
