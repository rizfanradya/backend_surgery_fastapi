from models.ot_type import OtType
from sqlalchemy.orm import Session
from typing import List, Dict


def transform_ot_types(sub_specialty_ot_types, session: Session):
    all_ot_types = session.query(OtType).all()
    ot_types_dict = {ot_type.description.lower(): {
        'id': ot_type.id, 'value': False} for ot_type in all_ot_types}
    for sot in sub_specialty_ot_types:
        ot_type = session.query(OtType).where(
            OtType.id == sot.ot_type_id).first()
        if ot_type:
            description = ot_type.description.lower()
            ot_types_dict[description]['value'] = True
    return ot_types_dict
