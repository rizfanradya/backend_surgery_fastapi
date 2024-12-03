from pydantic import BaseModel, EmailStr
from typing import List
from schemas.role import RoleSchema


class MainBaseSchema(BaseModel):
    email: EmailStr
    first_name: str
    last_name: str
    is_active: bool
    role_id: int


class UserSchema(MainBaseSchema):
    password: str


class BaseSchema(MainBaseSchema):
    id: int
    role: RoleSchema

    class Config:
        from_attributes = True


class UserResponseSchema(BaseModel):
    total_data: int
    data: List[BaseSchema]

    class Config:
        from_attributes = True
