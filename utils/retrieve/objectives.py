from sqlalchemy.orm import Session
from sqlalchemy import cast, String
from models.objectives import Objectives
from schemas.objectives import ObjectivesSchema


def retrieve_objectives(name: str, session: Session):
    data = session.query(Objectives).where(
        cast(Objectives.objectives, String).ilike(f'%{str(name)}%')).first()
    if data is None:
        new_data_schema = ObjectivesSchema(objectives=name, weight=0)
        new_data = Objectives(**new_data_schema.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    return data
