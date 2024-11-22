from pydantic import BaseModel
from typing import List, Optional
from decimal import Decimal


class MasterPlanSchema(BaseModel):
    description: Optional[str] = None
    objective_value: Decimal


class MasterPlanDataSchema(MasterPlanSchema):
    id: int

    class Config:
        from_attributes = True


class GetMasterPlanResponseSchema(BaseModel):
    total_data: int
    data: List[MasterPlanDataSchema]

    class Config:
        from_attributes = True
