from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class ClashingSubSpecialties(Base):
    __tablename__ = "clashing_subspecialties"

    id = Column(Integer, primary_key=True, index=True)
    sub_specialty_id = Column(
        Integer,
        ForeignKey('sub_specialty.id'),
        nullable=False
    )
    unit_id = Column(
        Integer,
        ForeignKey('unit.id'),
        nullable=False
    )
    sub_specialty = relationship(
        'SubSpecialty',
        back_populates='clashing_subspecialties'
    )
    unit = relationship('Unit', back_populates='clashing_subspecialties')
