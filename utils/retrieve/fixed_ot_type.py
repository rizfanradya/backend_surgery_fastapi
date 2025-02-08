from sqlalchemy.orm import Session
from sqlalchemy import cast, String
from models.ot_type import OtType
from schemas.ot_type import OtTypeSchema


def retrieve_fixed_ot_type(name: str, session: Session):
    data = session.query(OtType).where(
        cast(OtType.description, String).ilike(f'%{str(name)}%')).first()
    if data is None:
        new_data_schema = OtTypeSchema(description=name)
        new_data = OtType(**new_data_schema.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    return data
