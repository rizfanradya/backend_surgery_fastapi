from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey


class EquipmentRequirement(Base):
    __tablename__ = "equipment_requirement"

    id = Column(Integer, primary_key=True, index=True)
    unit_id = Column(
        Integer,
        ForeignKey('unit.id'),
        nullable=False
    )
    equipment_id = Column(
        Integer,
        ForeignKey('equipment.id'),
        nullable=False
    )
    equipment_requirement_status_id = Column(
        Integer,
        ForeignKey('equipment_requirement_status.id'),
        nullable=False
    )
