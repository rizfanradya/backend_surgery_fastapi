from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy.orm import relationship


class OtType(Base):
    __tablename__ = "ot_type"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
    ot = relationship('Ot', back_populates='ot_type')
    sub_specialties_ot_types = relationship(
        'SubSpecialtiesOtTypes',
        back_populates='ot_type'
    )
