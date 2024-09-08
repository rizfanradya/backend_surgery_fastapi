from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, DateTime
from sqlalchemy.sql import func


class Masterplan(Base):
    __tablename__ = "masterplan"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
    objective_value = Column(Integer, nullable=False)
    created_at = Column(DateTime, default=func.now(), nullable=False)
    uploaded_file = Column(String(length=255), nullable=False)
