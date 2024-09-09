from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey


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
