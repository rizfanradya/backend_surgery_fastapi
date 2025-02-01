from pydantic import BaseModel
from typing import List, Optional
from decimal import Decimal
from datetime import date
from .status import StatusSchema


class MasterPlanSchema(BaseModel):
    description: Optional[str] = None
    objective_value: Decimal
    start_date: date
    end_date: date


class BaseSchema(MasterPlanSchema):
    id: int
    status: StatusSchema

    class Config:
        from_attributes = True


class MasterPlanResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
