from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer


class ProcedureName(Base):
    __tablename__ = "procedure_name"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    subspecialty_id = Column(Integer, nullable=False)
