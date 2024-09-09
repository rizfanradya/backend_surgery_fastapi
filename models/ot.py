from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship


class Ot(Base):
    __tablename__ = "ot"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    ot_type_id = Column(Integer, ForeignKey('ot_type.id'), nullable=False)
    status_id = Column(Integer, ForeignKey('status.id'), nullable=False)
    ot_type = relationship('OtType', back_populates='ot')
    status = relationship('Status', back_populates='ot')
    fixed_ot = relationship('FixedOt', back_populates='ot')
    ot_assignment = relationship('OtAssignment', back_populates='ot')
    preferred_ot = relationship('PreferredOt', back_populates='ot')
    blocked_ot = relationship('BlockedOt', back_populates='ot')
