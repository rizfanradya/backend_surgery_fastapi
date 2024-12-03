from pydantic import BaseModel
from typing import List, Literal
from datetime import date


class SurgerySchema(BaseModel):
    mssp_id: int
    mrn: str
    unit_id: int
    booking_date: date
    estimated_duration: int
    procedure_name_id: int
    age: int
    gender_code: Literal['P', 'L']
    surgeon: str


class BaseSchema(SurgerySchema):
    id: int

    class Config:
        from_attributes = True


class SurgeryResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
