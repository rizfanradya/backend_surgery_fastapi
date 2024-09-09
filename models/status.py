from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer


class Status(Base):
    __tablename__ = "status"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
