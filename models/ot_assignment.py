from utils.database import Base
from sqlalchemy.schema import Column
from sqlalchemy.types import DateTime, Integer, Boolean
from sqlalchemy import ForeignKey


class OtAssignment(Base):
    __tablename__ = "ot_assignment"

    id = Column(Integer, primary_key=True, index=True)
    mssp_id = Column(Integer, ForeignKey('masterplan.id'), nullable=False)
    week_id = Column(Integer, ForeignKey('week.id'), nullable=False)
    ot_id = Column(Integer, ForeignKey('ot.id'), nullable=False)
    unit_id = Column(Integer, ForeignKey('unit.id'), nullable=False)
    day_id = Column(Integer, ForeignKey('day.id'), nullable=False)
    is_require_anaes = Column(Boolean, nullable=False)
    opening_time = Column(DateTime, nullable=False)
    closing_time = Column(DateTime, nullable=False)
