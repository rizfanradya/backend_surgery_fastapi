from typing import List, Dict
from pydantic import BaseModel
from typing import List


class UpdateObjectivesWeightsSchemaItem(BaseModel):
    id: int
    weight: int


class UpdateObjectivesWeightsSchema(BaseModel):
    UpdatesObj: List[UpdateObjectivesWeightsSchemaItem]


class BlockedOtSchema(BaseModel):
    id: int
    value: int
    label: str


class PreferredOtSchema(BaseModel):
    id: int
    value: int
    label: str


class BlockedDaySchema(BaseModel):
    id: int
    value: int
    label: str


class EquipmentRequirementSchema(BaseModel):
    id: int
    value: int
    label: str


class FixedOtSchema(BaseModel):
    id: int
    value: int
    label: str


class OtTypeSchema(BaseModel):
    id: int
    value: bool


class ConstraintsResponseSchema(BaseModel):
    id: int
    name: str
    max_slot_limit: int
    no_of_slots: int
    OtTypes: Dict[str, OtTypeSchema]
    blocked_ot: List[BlockedOtSchema] = []
    preferred_ot: List[PreferredOtSchema] = []
    blocked_day: List[BlockedDaySchema] = []
    equipment_requirement: List[EquipmentRequirementSchema] = []
    fixed_ot: List[FixedOtSchema] = []

    class Config:
        orm_mode = True


class ObjectiveSchema(BaseModel):
    id: int
    weight: int
    objectives: str

    class Config:
        orm_mode = True


class DataSchema(BaseModel):
    constraints: List[ConstraintsResponseSchema]
    objective: List[ObjectiveSchema]


class ResponseSchema(BaseModel):
    data: DataSchema

    class Config:
        orm_mode = True
