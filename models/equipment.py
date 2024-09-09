from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class Equipment(Base):
    __tablename__ = "equipment"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    quantity = Column(Integer, nullable=False)
    sub_specialty_id = Column(
        Integer,
        ForeignKey('sub_specialty.id'),
        nullable=False
    )
    sub_specialty = relationship('SubSpecialty', back_populates='equipment')
    equipment_requirement = relationship(
        'EquipmentRequirement',
        back_populates='equipment'
    )
