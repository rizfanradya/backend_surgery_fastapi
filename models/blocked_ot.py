from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class BlockedOt(Base):
    __tablename__ = "blocked_ot"

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
    ot = relationship('Ot', back_populates='blocked_ot')
    unit = relationship('Unit', back_populates='blocked_ot')
