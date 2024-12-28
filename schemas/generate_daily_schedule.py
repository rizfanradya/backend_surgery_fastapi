from pydantic import BaseModel


class ScheduleResourceSchema(BaseModel):
    resource: str
    value: int
    id: int
