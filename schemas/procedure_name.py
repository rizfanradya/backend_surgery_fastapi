from pydantic import BaseModel
from typing import List


class ProcedureNameSchema(BaseModel):
    name: str
    sub_specialty_id: int


class ProcedureNameDataSchema(ProcedureNameSchema):
    id: int

    class Config:
        from_attributes = True


class GetProcedureNameResponseSchema(BaseModel):
    total_data: int
    data: List[ProcedureNameDataSchema]

    class Config:
        from_attributes = True
