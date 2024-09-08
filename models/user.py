from utils.database import Base
from sqlalchemy import Enum
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Boolean


class User(Base):
    __tablename__ = "user"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String(length=300), unique=True, nullable=False)
    password = Column(String(length=300), nullable=False)
    first_name = Column(String(length=255), nullable=False)
    last_name = Column(String(length=255), nullable=False)
    is_active = Column(Boolean, default=True, nullable=False)
    role = Column(
        Enum('super admin', 'admin', 'user'),
        default='user',
        nullable=False
    )
