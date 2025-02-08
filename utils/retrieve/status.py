from sqlalchemy.orm import Session
from models.status import Status
from schemas.status import StatusSchema


def retrieve_status(name: str, session: Session):
    data = session.query(Status).where(
        Status.description.ilike(str(name))
    ).first()
    if data is None:
        new_data_schema = StatusSchema(description=name)
        new_data = Status(**new_data_schema.dict())
        session.add(new_data)
        session.commit()
        session.refresh(new_data)
        return new_data
    return data
