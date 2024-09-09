from pydantic import BaseModel
from typing import List


class EquipmentMspSchema(BaseModel):
    name: str
    quantity: int
    status_id: int


class EquipmentMspDataSchema(EquipmentMspSchema):
    id: int

    class Config:
        orm_mode = True


class GetEquipmentMspResponseSchema(BaseModel):
    total_data: int
    data: List[EquipmentMspDataSchema]

    class Config:
        orm_mode = True
