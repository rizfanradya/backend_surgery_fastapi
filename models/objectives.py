from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer


class Objectives(Base):
    __tablename__ = "objectives"

    id = Column(Integer, primary_key=True, index=True)
    objectives = Column(String(length=255), nullable=False)
    weight = Column(Integer, nullable=False)
