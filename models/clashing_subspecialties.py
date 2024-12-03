from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class ClashingSubSpecialties(Base):
    __tablename__ = "clashing_subspecialties"

    id = Column(Integer, primary_key=True, index=True)
    clashing_groups_id = Column(
        Integer,
        ForeignKey('clashing_groups.id'),
        nullable=False
    )
    unit_id = Column(
        Integer,
        ForeignKey('unit.id'),
        nullable=False
    )
    clashing_groups = relationship(
        'ClashingGroups',
        back_populates='clashing_subspecialties'
    )
    unit = relationship('Unit', back_populates='clashing_subspecialties')
