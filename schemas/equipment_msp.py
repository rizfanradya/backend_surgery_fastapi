from pydantic import BaseModel
from typing import List


class EquipmentMspSchema(BaseModel):
    name: str
    quantity: int
    status_id: int


class BaseSchema(EquipmentMspSchema):
    id: int

    class Config:
        from_attributes = True


class EquipmentMspResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
