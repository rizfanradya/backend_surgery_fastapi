from pydantic import BaseModel
from typing import List


class MasterPlanSchema(BaseModel):
    description: str
    objective_value: int
    uploaded_file: str


class MasterPlanDataSchema(MasterPlanSchema):
    id: int

    class Config:
        orm_mode = True


class GetMasterPlanResponseSchema(BaseModel):
    total_data: int
    data: List[MasterPlanDataSchema]

    class Config:
        orm_mode = True
