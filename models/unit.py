from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Boolean


class Unit(Base):
    __tablename__ = "unit"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    subspecialty_id = Column(Integer, nullable=False)
    is_require_anaes = Column(Boolean, nullable=False)
    max_slot_limit = Column(Integer, nullable=False)
    no_of_slots = Column(Integer, nullable=False)
    resource_requirement_id = Column(Integer, nullable=False)
    color_hex = Column(String(length=7), nullable=False)
