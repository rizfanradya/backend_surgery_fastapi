from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class SubSpecialtiesClashingGroups(Base):
    __tablename__ = "sub_specialties_clashing_groups"

    id = Column(Integer, primary_key=True, index=True)
    clashing_group_id = Column(
        Integer,
        ForeignKey('clashing_groups.id'),
        nullable=False
    )
    sub_specialty_id = Column(
        Integer,
        ForeignKey('sub_specialty.id'),
        nullable=False
    )
    clashing_groups = relationship(
        'ClashingGroups',
        back_populates='sub_specialties_clashing_groups'
    )
    sub_specialty = relationship(
        'SubSpecialty',
        back_populates='sub_specialties_clashing_groups'
    )
