from pydantic import BaseModel
from typing import List


class ProcedureNameSchema(BaseModel):
    name: str
    sub_specialty_id: int


class BaseSchema(ProcedureNameSchema):
    id: int

    class Config:
        from_attributes = True


class ProcedureNameResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
