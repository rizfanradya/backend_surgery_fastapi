from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Date, Enum
from sqlalchemy.orm import relationship
from sqlalchemy import ForeignKey


class Surgery(Base):
    __tablename__ = "surgery"

    id = Column(Integer, primary_key=True, index=True)
    mrn = Column(String(length=255), nullable=False)
    booking_date = Column(Date, nullable=False)
    estimated_duration = Column(Integer, nullable=False)
    age = Column(Integer, nullable=False)
    gender_code = Column(Enum('P', 'L'), nullable=False)
    surgeon = Column(String(length=255), nullable=False)
    unit_id = Column(
        Integer,
        ForeignKey('unit.id'),
        nullable=False
    )
    unit = relationship('Unit', back_populates='surgery')
    procedure_name_id = Column(
        Integer,
        ForeignKey('procedure_name.id'),
        nullable=False
    )
    procedure_name = relationship('ProcedureName', back_populates='surgery')
    mssp_id = Column(Integer, ForeignKey('masterplan.id'), nullable=False)
    masterplan = relationship('Masterplan', back_populates='surgery')
