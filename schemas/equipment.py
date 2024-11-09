from pydantic import BaseModel
from typing import List


class EquipmentSchema(BaseModel):
    name: str
    quantity: int
    sub_specialty_id: int


class EquipmentDataSchema(EquipmentSchema):
    id: int

    class Config:
        from_attributes = True


class GetEquipmentResponseSchema(BaseModel):
    total_data: int
    data: List[EquipmentDataSchema]

    class Config:
        from_attributes = True
