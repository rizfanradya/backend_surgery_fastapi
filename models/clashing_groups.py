from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey


class ClashingGroups(Base):
    __tablename__ = "clashing_groups"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
