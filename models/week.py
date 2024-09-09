from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer


class Week(Base):
    __tablename__ = "week"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    status_id = Column(Integer, nullable=False)
