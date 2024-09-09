from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy.orm import relationship


class ClashingGroups(Base):
    __tablename__ = "clashing_groups"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
    sub_specialties_clashing_groups = relationship(
        'SubSpecialtiesClashingGroups',
        back_populates='clashing_groups'
    )
