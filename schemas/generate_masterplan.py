from pydantic import BaseModel
from typing import List


class UpdateObjectivesWeightsSchemaItem(BaseModel):
    id: int
    weight: int


class UpdateObjectivesWeightsSchema(BaseModel):
    UpdatesObj: List[UpdateObjectivesWeightsSchemaItem]
