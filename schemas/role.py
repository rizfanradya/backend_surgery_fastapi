from pydantic import BaseModel
from typing import List


class RoleSchema(BaseModel):
    role: str


class RoleDataSchema(RoleSchema):
    id: int

    class Config:
        from_attributes = True


class GetRoleResponseSchema(BaseModel):
    total_data: int
    data: List[RoleDataSchema]

    class Config:
        from_attributes = True
