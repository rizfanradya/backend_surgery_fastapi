from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer
from sqlalchemy.orm import relationship


class EquipmentRequirementStatus(Base):
    __tablename__ = "equipment_requirement_status"

    id = Column(Integer, primary_key=True, index=True)
    description = Column(String(length=255), nullable=False)
    penalty_value = Column(Integer, nullable=False)
    equipment_requirement = relationship(
        'EquipmentRequirement',
        back_populates='equipment_requirement_status'
    )
