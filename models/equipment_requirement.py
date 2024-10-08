from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


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
    unit = relationship('Unit', back_populates='equipment_requirement')
    equipment = relationship(
        'Equipment',
        back_populates='equipment_requirement'
    )
    equipment_requirement_status = relationship(
        'EquipmentRequirementStatus',
        back_populates='equipment_requirement'
    )
