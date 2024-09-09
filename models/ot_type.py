from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer


class OtType(Base):
    __tablename__ = "ot_type"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
