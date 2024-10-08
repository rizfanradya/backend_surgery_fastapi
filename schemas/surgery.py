from pydantic import BaseModel
from typing import List, Literal
from datetime import date


class SurgerySchema(BaseModel):
    mrn: str
    unit_id: int
    booking_date: date
    estimated_duration: int
    procedure_name_id: int
    age: int
    gender_code: Literal['P', 'L']
    surgeon: str


class SurgeryDataSchema(SurgerySchema):
    id: int

    class Config:
        orm_mode = True


class GetSurgeryResponseSchema(BaseModel):
    total_data: int
    data: List[SurgeryDataSchema]

    class Config:
        orm_mode = True
