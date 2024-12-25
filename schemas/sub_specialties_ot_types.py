from pydantic import BaseModel
from typing import List


class SubSpecialtiesOtTypesSchema(BaseModel):
    sub_specialty_id: int
    ot_type_id: int
    unit_id: int


class BaseSchema(SubSpecialtiesOtTypesSchema):
    id: int

    class Config:
        from_attributes = True


class SubSpecialtiesOtTypesResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
