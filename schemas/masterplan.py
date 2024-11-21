from pydantic import BaseModel
from typing import List, Optional


class MasterPlanSchema(BaseModel):
    description: Optional[str] = None
    objective_value: int


class MasterPlanDataSchema(MasterPlanSchema):
    id: int

    class Config:
        from_attributes = True


class GetMasterPlanResponseSchema(BaseModel):
    total_data: int
    data: List[MasterPlanDataSchema]

    class Config:
        from_attributes = True
