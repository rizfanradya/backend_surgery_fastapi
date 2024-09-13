from pydantic import BaseModel
from typing import List


class RoleSchema(BaseModel):
    role: str


class RoleDataSchema(RoleSchema):
    id: int

    class Config:
        orm_mode = True


class GetRoleResponseSchema(BaseModel):
    total_data: int
    data: List[RoleDataSchema]

    class Config:
        orm_mode = True
