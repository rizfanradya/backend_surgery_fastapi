from pydantic import BaseModel


class MasterplanSchema(BaseModel):
    description: str
    objective_value: int
