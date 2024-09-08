from models.user import User
from schemas.user import UserSchema
from .database import SessionLocal
from pydantic import EmailStr
from .hashed_password import hashed_password


def data_that_must_exist_in_the_database():
    session = SessionLocal()
    user_admin = session.query(User).where(
        User.role == 'admin').first()
    if not user_admin:
        user_schema = UserSchema(
            email=EmailStr('admin@gmail.com'),
            password=hashed_password('@Admin123'),
            first_name='admin',
            last_name='01',
            role='admin',
            is_active=True
        )
        session.add(User(**user_schema.dict()))
        session.commit()
