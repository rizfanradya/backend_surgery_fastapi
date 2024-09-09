from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class SubSpecialty(Base):
    __tablename__ = "sub_specialty"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
    specialty_id = Column(Integer, ForeignKey('specialty.id'), nullable=False)
    color_hex = Column(String(length=7), nullable=False)
    specialty = relationship('Specialty', back_populates='sub_specialty')
    equipment = relationship('Equipment', back_populates='sub_specialty')
    unit = relationship('Unit', back_populates='sub_specialty')
    procedure_name = relationship(
        'ProcedureName',
        back_populates='sub_specialty'
    )
    sub_specialties_clashing_groups = relationship(
        'SubSpecialtiesClashingGroups',
        back_populates='sub_specialty'
    )
    sub_specialties_ot_types = relationship(
        'SubSpecialtiesOtTypes',
        back_populates='sub_specialty'
    )
