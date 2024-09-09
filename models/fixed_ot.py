from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey


class FixedOt(Base):
    __tablename__ = "fixed_ot"

    id = Column(Integer, primary_key=True, index=True)
    ot_id = Column(
        Integer,
        ForeignKey('ot.id'),
        nullable=False
    )
    unit_id = Column(
        Integer,
        ForeignKey('unit.id'),
        nullable=False
    )
