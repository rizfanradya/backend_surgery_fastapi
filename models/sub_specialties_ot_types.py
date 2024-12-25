from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class SubSpecialtiesOtTypes(Base):
    __tablename__ = "sub_specialties_ot_types"

    id = Column(Integer, primary_key=True, index=True)
    sub_specialty_id = Column(
        Integer,
        ForeignKey('sub_specialty.id'),
        nullable=False
    )
    sub_specialty = relationship(
        'SubSpecialty',
        back_populates='sub_specialties_ot_types'
    )
    unit_id = Column(
        Integer,
        ForeignKey('unit.id'),
        nullable=False
    )
    unit = relationship('Unit', back_populates='sub_specialties_ot_types')
    ot_type_id = Column(
        Integer,
        ForeignKey('ot_type.id'),
        nullable=False
    )
    ot_type = relationship('OtType', back_populates='sub_specialties_ot_types')
