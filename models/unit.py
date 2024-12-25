from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Boolean
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship
from .clashing_subspecialties import ClashingSubSpecialties


class Unit(Base):
    __tablename__ = "unit"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    sub_specialty_id = Column(
        Integer,
        ForeignKey('sub_specialty.id'),
        nullable=False
    )
    is_require_anaes = Column(Boolean, nullable=False)
    max_slot_limit = Column(Integer, nullable=False)
    no_of_slots = Column(Integer, nullable=False)
    resource_requirement_id = Column(Integer, nullable=False)
    color_hex = Column(String(length=7), nullable=False)
    sub_specialty = relationship('SubSpecialty', back_populates='unit')
    blocked_day = relationship('BlockedDay', back_populates='unit')
    blocked_ot = relationship('BlockedOt', back_populates='unit')
    equipment_requirement = relationship(
        'EquipmentRequirement',
        back_populates='unit'
    )
    fixed_ot = relationship('FixedOt', back_populates='unit')
    ot_assignment = relationship('OtAssignment', back_populates='unit')
    preferred_ot = relationship('PreferredOt', back_populates='unit')
    surgery = relationship('Surgery', back_populates='unit')
    sub_specialties_ot_types = relationship(
        'SubSpecialtiesOtTypes',
        back_populates='unit'
    )
    clashing_subspecialties = relationship(
        'ClashingSubSpecialties',
        back_populates='unit'
    )
