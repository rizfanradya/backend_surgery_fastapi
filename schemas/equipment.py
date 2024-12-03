from pydantic import BaseModel
from typing import List


class EquipmentSchema(BaseModel):
    name: str
    quantity: int
    sub_specialty_id: int


class BaseSchema(EquipmentSchema):
    id: int

    class Config:
        from_attributes = True


class EquipmentResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
