from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer


class Ot(Base):
    __tablename__ = "ot"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    ot_type_id = Column(Integer, nullable=False)
    status_id = Column(Integer, nullable=False)
