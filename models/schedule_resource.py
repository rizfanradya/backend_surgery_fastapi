from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer


class ScheduleResource(Base):
    __tablename__ = "schedule_resource"

    id = Column(Integer, primary_key=True, index=True)
    resource = Column(String(length=255), nullable=False)
    value = Column(Integer)
