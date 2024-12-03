from pydantic import BaseModel
from typing import List, Optional
from decimal import Decimal


class MasterPlanSchema(BaseModel):
    description: Optional[str] = None
    objective_value: Decimal


class BaseSchema(MasterPlanSchema):
    id: int

    class Config:
        from_attributes = True


class MasterPlanResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
