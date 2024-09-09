from pydantic import BaseModel
from typing import List


class SubSpecialtiesOtTypesSchema(BaseModel):
    sub_specialty_id: int
    ot_type_id: int


class SubSpecialtiesOtTypesDataSchema(SubSpecialtiesOtTypesSchema):
    id: int

    class Config:
        orm_mode = True


class GetSubSpecialtiesOtTypesResponseSchema(BaseModel):
    total_data: int
    data: List[SubSpecialtiesOtTypesDataSchema]

    class Config:
        orm_mode = True
