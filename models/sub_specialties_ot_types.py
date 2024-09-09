from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey


class SubSpecialtiesOtTypes(Base):
    __tablename__ = "sub_specialties_ot_types"

    id = Column(Integer, primary_key=True, index=True)
    sub_specialty_id = Column(
        Integer,
        ForeignKey('sub_specialty.id'),
        nullable=False
    )
    ot_type_id = Column(
        Integer,
        ForeignKey('ot_type.id'),
        nullable=False
    )
