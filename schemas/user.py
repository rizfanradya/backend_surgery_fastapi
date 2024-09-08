from pydantic import BaseModel, EmailStr
from typing import Literal


class UserSchema(BaseModel):
    email: EmailStr
    password: str
    first_name: str
    last_name: str
    is_active: bool
    role: Literal['user', 'super admin', 'admin']
