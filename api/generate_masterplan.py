from fastapi import APIRouter, Depends, File, UploadFile
from fastapi.responses import StreamingResponse
from sqlalchemy.orm import Session, joinedload
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.to_camel_case import to_camel_case
from utils.error_response import send_error_response
from typing import Literal, Optional
from sqlalchemy import asc, desc
from io import BytesIO
from datetime import datetime
from openpyxl import load_workbook, Workbook
from schemas.generate_masterplan import UpdateObjectivesWeightsSchema
from models.masterplan import Masterplan
from models.procedure_name import ProcedureName
from models.ot_assignment import OtAssignment
from models.ot import Ot
from models.unit import Unit
from models.week import Week
from models.day import Day
from models.objectives import Objectives

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
        "data": query
    }


@router.get('/constraints')
def constraints(
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    objectives = session.query(Objectives).order_by(
        Objectives.id).all()  # type: ignore
    units = (
        session.query(Unit)
        .options(
            joinedload(Unit.fixed_ot),
            joinedload(Unit.blocked_ot),
            joinedload(Unit.preferred_ot),
            joinedload(Unit.blocked_day),
            joinedload(Unit.equipment_requirement),
        )
        .order_by(Unit.id)  # type: ignore
        .all()
    )

    return {
        'data': {
            'constraints': units,
            'objective': objectives
        }
    }

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
def update_objectives_weight(objectives_weights: UpdateObjectivesWeightsSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    for update in objectives_weights.UpdatesObj:
        data = session.query(Objectives).get(update.id)
        if data is not None:
            data.weight = update.weight
        session.commit()
        session.refresh(data)
    return objectives_weights


@router.post('/ins-constraints')
def set_constraints(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.post('/generate')
def generate_masterplan(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    return 'ok'


@router.get('/otassignment')
def otassignment(
    mssp_id: int,
    ot_id: Optional[int] = None,
    unit_id: Optional[int] = None,
    week_id: Optional[int] = None,
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    masterplan = session.query(Masterplan).get(mssp_id)
    if masterplan is None:
        return send_error_response('Masterplan not found.')

    ot_assignment = session.query(OtAssignment).join(
        Day).join(Unit).where(OtAssignment.mssp_id == mssp_id)  # type: ignore

    if ot_id:
        ot_assignment = ot_assignment.where(
            OtAssignment.ot_id == ot_id)
    if unit_id:
        ot_assignment = ot_assignment.where(
            OtAssignment.unit_id == unit_id)
    if week_id:
        ot_assignment = ot_assignment.where(
            OtAssignment.week_id == week_id)

    ot_assignment = ot_assignment.all()
    ot_assignments_map = {}

    for assignment in ot_assignment:
        ot_id = assignment.ot_id
        day_name = assignment.day.name.lower()
        if ot_id not in ot_assignments_map:
            ot_assignments_map[ot_id] = {}
        ot_assignments_map[ot_id][day_name] = {
            "unit_name": assignment.unit.name,
            "is_require_anaes": assignment.is_require_anaes,
            "time": f"{assignment.opening_time} - {assignment.closing_time}",
            "color_hex": assignment.unit.color_hex
        }

    all_ot_ids = session.query(Ot.id).all()
    all_ot_ids = [ot_id[0] for ot_id in all_ot_ids]

    grouped_data = []
    for ot_id in all_ot_ids:
        week_data = ot_assignments_map.get(ot_id, {})
        grouped_data.append({
            "ot_id": ot_id,
            "week": week_data
        })

    grouped_data.sort(key=lambda x: x["ot_id"])
    weeks = session.query(Week).all()

    return {
        "otassignment": grouped_data,
        "masterPlan": masterplan,
        "weeks": weeks
    }


@router.post('/validity')
def check_excell_format(file: UploadFile = File(...), session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    if file.content_type not in ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel"]:
        send_error_response('Wrong file type, only accept xlsx')
    expected_headers = [
        "BOOKING DATE", "OPERATION DATE", "MRN", "AGE", "GENDER CODE", "DIAGNOSIS", "COMMENT",
        "ANAES TYPE", "ANAES ID", "TYPE OF OPERATION", "SUBSPECIALITY DESC", "SPECIALITY ID",
        "OT LIST NAME", "PROCEDURE NAME", "DURATION", "BOOKED BY", "SURGEON"
    ]
    contents = file.file.read()
    excel_data = BytesIO(contents)
    workbook = load_workbook(excel_data)
    sheet = workbook.active
    actual_headers = [cell.value for cell in sheet[1]]  # type: ignore
    mismatched_headers = []
    for idx, (expected, actual) in enumerate(zip(expected_headers, actual_headers), start=1):
        if expected != actual:
            mismatched_headers.append(
                f"Column {idx}: Expected '{expected}', found '{actual}'"
            )
    if mismatched_headers:
        return send_error_response(f"Mismatched columns: {', '.join(mismatched_headers)}")
    procedure_names = {p.name for p in session.query(ProcedureName).all()}
    ot_names = {o.name for o in session.query(Ot).all()}
    unit_names = {u.name for u in session.query(Unit).all()}
    errors = []
    for row_idx, row in enumerate(
        sheet.iter_rows(min_row=2, values_only=True),  # type: ignore
        start=2
    ):
        procedure_name = str(row[13])
        ot_list_name = str(row[12])
        subspeciality_desc = str(row[10])
        if procedure_name not in procedure_names:
            errors.append({
                'row': row_idx,
                'column': 'PROCEDURE NAME',
                'error': f"'{procedure_name}' not found in database."
            })
        if ot_list_name not in ot_names:
            errors.append({
                'row': row_idx,
                'column': 'OT LIST NAME',
                'error': f"'{ot_list_name}' not found in database."
            })
        if subspeciality_desc not in unit_names:
            errors.append({
                'row': row_idx,
                'column': 'SUBSPECIALITY DESC',
                'error': f"'{subspeciality_desc}' not found in database."
            })
    if errors:
        return send_error_response(errors, 'Invalid data found in the excel file.')
    return {'message': 'Excel file is valid with correct headers and data matching the database.'}


@router.get('/template')
def download_template(token: str = Depends(TokenAuthorization)):
    workbook = Workbook()
    sheet = workbook.active
    sheet.title = "template"  # type: ignore
    headers = [
        "BOOKING DATE", "OPERATION DATE", "MRN", "AGE", "GENDER CODE", "DIAGNOSIS", "COMMENT",
        "ANAES TYPE", "ANAES ID", "TYPE OF OPERATION", "SUBSPECIALITY DESC", "SPECIALITY ID",
        "OT LIST NAME", "PROCEDURE NAME", "DURATION", "BOOKED BY", "SURGEON"
    ]
    for col_num, header in enumerate(headers, 1):
        sheet.cell(row=1, column=col_num, value=header)  # type: ignore
    output = BytesIO()
    workbook.save(output)
    output.seek(0)
    filename = datetime.now().strftime(f'masterplan_format_%Y-%B-%d_%H:%M:%S.xlsx')
    return StreamingResponse(
        output,
        media_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        headers={"Content-Disposition": f"attachment; filename={filename}"}
    )
