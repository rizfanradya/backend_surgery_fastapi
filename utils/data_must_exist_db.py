from models.user import User
from schemas.user import UserSchema
from .database import SessionLocal
from .hashed_password import hashed_password
from models.role import Role
from schemas.role import RoleSchema


def data_that_must_exist_in_the_database():
    session = SessionLocal()
    role_admin = session.query(Role).where(Role.role == 'admin').first()
    if not role_admin:
        role_schema = RoleSchema(
            role='admin'
        )
        new_role_admin = Role(**role_schema.dict())
        session.add(new_role_admin)
        session.commit()
        session.refresh(new_role_admin)
        role_admin = new_role_admin

    user_admin = session.query(User).where(
        User.role_id == role_admin.id).first()
    if not user_admin:
        user_schema = UserSchema(
            email='admin@gmail.com',
            password=hashed_password('@Admin123'),
            first_name='admin',
            last_name='01',
            role_id=role_admin.id,
            is_active=True
        )
        new_user = User(**user_schema.dict())
        session.add(new_user)
        session.commit()
        session.refresh(new_user)
