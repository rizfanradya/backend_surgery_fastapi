from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session, joinedload
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.to_camel_case import to_camel_case
from typing import Literal, Optional
from models.masterplan import Masterplan
from sqlalchemy import asc, desc

router = APIRouter()


@router.get('/list-master')
def masterplan(
    limit: int = 10,
    offset: int = 0,
    order: Optional[Literal['asc', 'desc']] = 'asc',
    sort_by: Optional[Literal[
        'id',
        'created_at',
        'description',
        'objective_value'
    ]] = 'id',
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    query = session.query(Masterplan)
    column_map = {
        'id': Masterplan.id,
        'created_at': Masterplan.created_at,
        'description': Masterplan.description,
        'objective_value': Masterplan.objective_value
    }
    if sort_by in column_map:
        sort_column = column_map[sort_by]
        sort_order = asc if order == 'asc' else desc
        query = query.order_by(sort_order(sort_column))  # type: ignore
    total = query.count()
    query = query.offset(offset).limit(limit).all()  # type: ignore
    return {
        "total": total,
        "limit": limit,
        "offset": offset,
        "data": query
    }


@router.get('/constraints')
def constraints(
    limit: int = 10,
    offset: int = 0,
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    # units = session.query(Unit).options(
    #     joinedload(Unit.fixed_ots),
    #     joinedload(Unit.blocked_ots),
    #     joinedload(Unit.preferred_ots),
    #     joinedload(Unit.blocked_days).joinedload(Unit.blocked_days.day),
    #     joinedload(Unit.equipment_requirements),
    #     joinedload(Unit.subspecialty).joinedload(
    #         Unit.subspecialty.SubspecialtiesClashingGroups).joinedload(ClashingGroups),
    #     joinedload(Unit.subspecialty).joinedload(
    #         Unit.subspecialty.SubspecialtiesOtTypes).joinedload(OtType)
    # ).order_by(Unit.id).offset(offset).limit(limit).all()

    # setobj = session.query(Objectives).order_by(Objectives.id).all()
    # all_ots = session.query(Ot).order_by(Ot.id).all()
    # all_equipment_msps = session.query(
    #     EquipmentMsp).order_by(EquipmentMsp.id).all()
    # all_clashing_groups = session.query(
    #     ClashingGroups).order_by(ClashingGroups.id).all()
    # all_days = session.query(Day).order_by(Day.day_id).all()
    # all_ot_types = session.query(OtType).order_by(OtType.id).all()
    # all_subspecialties = session.query(
    #     Subspecialty).order_by(Subspecialty.id).all()

    # total = len(units)
    # constraints = []

    # for unit in units:
    #     subspecialty_opt = [
    #         {"value": subspecialty.id, "label": subspecialty.description}
    #         for subspecialty in all_subspecialties
    #     ]

    #     selected_subspecialties = [
    #         {"value": subspecialty.id, "label": subspecialty.description}
    #         for scg in unit.subspecialty.subspecialties_clashing_groups
    #         for subspecialty in all_subspecialties if subspecialty.id == scg.subspecialty_id
    #     ]

    #     existing_fixed_ot_ids = {fot.ot_id for fot in unit.fixed_ots}
    #     existing_blocked_ot_ids = {bot.ot_id for bot in unit.blocked_ots}
    #     existing_preferred_ot_ids = {pot.ot_id for pot in unit.preferred_ots}

    #     fixed_ot_opts = [{"label": ot.id, "value": ot.id} for ot in all_ots]
    #     blocked_ot_opts = [{"label": ot.id, "value": ot.id} for ot in all_ots]
    #     preferred_ot_opts = [
    #         {"label": ot.id, "value": ot.id}
    #         for ot in all_ots if ot.id not in existing_preferred_ot_ids
    #     ]

    #     fixed_ot = [
    #         {"label": fot.ot_id, "value": fot.ot_id}
    #         for fot in unit.fixed_ots
    #     ]
    #     blocked_ot = [
    #         {"label": bot.ot_id, "value": bot.ot_id}
    #         for bot in unit.blocked_ots
    #     ]
    #     preferred_ot = [
    #         {"label": pot.ot_id, "value": pot.ot_id}
    #         for pot in unit.preferred_ots
    #     ]

    #     equipment_requirement_opts = [
    #         {"label": emsp.name, "value": emsp.id} for emsp in all_equipment_msps
    #     ]
    #     equipment_requirements = [
    #         {"label": emsp.name, "value": emsp.id}
    #         for er in unit.equipment_requirements
    #         for emsp in all_equipment_msps if er.equipment_id == emsp.id
    #     ]

    #     clashing_group_opts = [
    #         {"label": cg.description, "value": cg.id} for cg in all_clashing_groups
    #     ]
    #     clashing_groups = [
    #         {"label": cg.description, "value": cg.id}
    #         for scg in unit.subspecialty.subspecialties_clashing_groups
    #         for cg in scg.clashing_groups
    #     ]

    #     blocked_day_opts = [
    #         {"label": day.name, "value": day.day_id} for day in all_days
    #     ]
    #     blocked_days = [
    #         {"label": day.name, "value": day.day_id}
    #         for bd in unit.blocked_days for day in bd.day
    #     ]

    #     ot_types = {}
    #     existing_ot_type_ids = {
    #         sot.ot_type_id for sot in unit.subspecialty.subspecialties_ot_types
    #     }
    #     for sot in unit.subspecialty.subspecialties_ot_types:
    #         for ot_type in sot.ot_type:
    #             ot_types[to_camel_case(ot_type.description)] = {
    #                 "value": True, "id": ot_type.id
    #             }

    #     for ot_type in all_ot_types:
    #         if ot_type.id not in existing_ot_type_ids:
    #             ot_types[to_camel_case(ot_type.description)] = {
    #                 "value": False, "id": ot_type.id
    #             }

    #     constraints.append({
    #         "id": unit.id,
    #         "name": unit.name,
    #         "subspecialty_id": unit.subspecialty_id,
    #         "is_require_anaes": unit.is_require_anaes,
    #         "max_slot_limit": unit.max_slot_limit,
    #         "no_of_slots": unit.no_of_slots,
    #         "resource_requirement_id": unit.resource_requirement_id,
    #         "FixedOT": fixed_ot,
    #         "FixedOtOpt": fixed_ot_opts,
    #         "BlockedOT": blocked_ot,
    #         "BlockedOtOpt": blocked_ot_opts,
    #         "PreferredOT": preferred_ot,
    #         "PreferredOtOpt": preferred_ot_opts,
    #         "EquipmentRequirement": equipment_requirements,
    #         "EquipmentRequirementOpt": equipment_requirement_opts,
    #         "ClashingGroup": clashing_groups,
    #         "ClashingGroupOpt": clashing_group_opts,
    #         "BlockedDay": blocked_days,
    #         "BlockedDayOpt": blocked_day_opts,
    #         "OtTypes": ot_types,
    #         "SubspecialtyOpt": subspecialty_opt,
    #         "SelectedSubspecialties": selected_subspecialties,
    #     })

    # setobj_data = [
    #     {"id": obj.id, "objectives": obj.objectives, "weight": obj.weight}
    #     for obj in setobj
    # ]

    # reformatted_data = {
    #     "constraints": constraints,
    #     "objective": setobj_data,
    # }

    return {
        "total": 'total',
        "offset": offset,
        "limit": limit,
        "data": 'reformatted_data'
    }


@router.post('/objectives')
def objectives(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/ins-constraints')
def set_constraints(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/generate')
def generate_masterplan(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/otassignment')
def otassignment(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/validity')
def check_excell_format(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/template')
def download_template(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'
