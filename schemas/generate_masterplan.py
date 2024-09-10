from typing import List, Dict
from pydantic import BaseModel
from typing import List


class ObjectivesItemSchema(BaseModel):
    id: int
    weight: int


class UpdateObjectivesWeightsSchema(BaseModel):
    UpdatesObj: List[ObjectivesItemSchema]


class OtItemBaseSchema(BaseModel):
    id: int
    value: bool


class UnitItemBaseSchema(BaseModel):
    value: int
    label: str


class UnitBaseSchema(BaseModel):
    id: int
    name: str
    max_slot_limit: int
    no_of_slots: int
    ot_types: Dict[str, OtItemBaseSchema]
    fixed_ots: List[UnitItemBaseSchema] = []
    fixed_ot_opt: List[UnitItemBaseSchema] = []
    blocked_ots: List[UnitItemBaseSchema] = []
    blocked_ot_opt: List[UnitItemBaseSchema] = []
    preferred_ots: List[UnitItemBaseSchema] = []
    preferred_ot_opt: List[UnitItemBaseSchema] = []
    blocked_days: List[UnitItemBaseSchema] = []
    blocked_day_opt: List[UnitItemBaseSchema] = []
    equipment_requirements: List[UnitItemBaseSchema] = []
    equipment_requirement_opt: List[UnitItemBaseSchema] = []
    sub_specialtys: List[UnitItemBaseSchema] = []
    sub_specialty_opt: List[UnitItemBaseSchema] = []

    class Config:
        orm_mode = True


class ObjectiveBaseSchema(ObjectivesItemSchema):
    objectives: str

    class Config:
        orm_mode = True


class ConstraintsBaseSchema(BaseModel):
    constraints: List[UnitBaseSchema]
    objective: List[ObjectiveBaseSchema]


class ConstraintsResponseSchema(BaseModel):
    data: ConstraintsBaseSchema

    class Config:
        orm_mode = True
