from pydantic import BaseModel, EmailStr
from typing import Literal, List


class BaseSchema(BaseModel):
    email: EmailStr
    first_name: str
    last_name: str
    is_active: bool
    role: Literal['user', 'super admin', 'admin']


class UserSchema(BaseSchema):
    password: str


class UserDataSchema(BaseSchema):
    id: int

    class Config:
        orm_mode = True


class GetUserResponseSchema(BaseModel):
    total_data: int
    data: List[UserDataSchema]

    class Config:
        orm_mode = True
