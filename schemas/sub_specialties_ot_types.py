from pydantic import BaseModel
from typing import List


class SubSpecialtiesOtTypesSchema(BaseModel):
    sub_specialty_id: int
    ot_type_id: int


class SubSpecialtiesOtTypesDataSchema(SubSpecialtiesOtTypesSchema):
    id: int

    class Config:
        from_attributes = True


class GetSubSpecialtiesOtTypesResponseSchema(BaseModel):
    total_data: int
    data: List[SubSpecialtiesOtTypesDataSchema]

    class Config:
        from_attributes = True
