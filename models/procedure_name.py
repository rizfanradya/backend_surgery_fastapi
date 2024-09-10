from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship
from .surgery import Surgery


class ProcedureName(Base):
    __tablename__ = "procedure_name"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(length=255), nullable=False)
    sub_specialty_id = Column(
        Integer,
        ForeignKey('sub_specialty.id'),
        nullable=False
    )
    sub_specialty = relationship(
        'SubSpecialty',
        back_populates='procedure_name'
    )
    surgery = relationship(
        'Surgery',
        back_populates='procedure_name'
    )
