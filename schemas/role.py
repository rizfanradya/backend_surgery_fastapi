from pydantic import BaseModel
from typing import List


class RoleSchema(BaseModel):
    role: str


class BaseSchema(RoleSchema):
    id: int

    class Config:
        from_attributes = True


class RoleResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
