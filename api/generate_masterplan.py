from fastapi import APIRouter, Depends, File, UploadFile
from fastapi.responses import StreamingResponse
from sqlalchemy.orm import Session, joinedload
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.transform_ot_type import transform_ot_types
from utils.error_response import send_error_response
from typing import Literal, Optional, List
from sqlalchemy import asc, desc
from io import BytesIO
from datetime import datetime
from openpyxl import load_workbook, Workbook
from schemas.generate_masterplan import UpdateObjectivesWeightsSchema, ConstraintsResponseSchema, InsertConstraintsSchema
from models.masterplan import Masterplan
from models.procedure_name import ProcedureName
from models.ot_assignment import OtAssignment
from models.ot import Ot
from models.unit import Unit
from models.week import Week
from models.day import Day
from models.objectives import Objectives
from models.sub_specialties_ot_types import SubSpecialtiesOtTypes
from models.sub_specialties_clashing_groups import SubSpecialtiesClashingGroups
from models.ot_type import OtType
from models.equipment_msp import EquipmentMsp
from models.sub_specialty import SubSpecialty

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


@router.get('/constraints', response_model=ConstraintsResponseSchema)
def constraints(session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    all_ots = session.query(Ot).all()
    all_days = session.query(Day).order_by(Day.id).all()  # type: ignore
    all_equipment_msp = session.query(EquipmentMsp).all()
    all_sub_specialty = session.query(SubSpecialty).all()
    objectives = session.query(Objectives).order_by(
        Objectives.id).all()  # type: ignore
    units = session.query(Unit).options(
        joinedload(Unit.fixed_ot),
        joinedload(Unit.blocked_ot),
        joinedload(Unit.preferred_ot),
        joinedload(Unit.blocked_day),
        joinedload(Unit.equipment_requirement),
    ).order_by(Unit.id).all()  # type: ignore

    day_mapping = {day.id: day.name for day in all_days}
    er_msp_mapping = {e_msp.id: e_msp.name for e_msp in all_equipment_msp}
    sub_specialty_mappintg = {
        ssp.id: ssp.description for ssp in all_sub_specialty
    }
    for unit in units:
        sub_specialty_ot_type = session.query(SubSpecialtiesOtTypes).outerjoin(OtType).where(
            SubSpecialtiesOtTypes.sub_specialty_id == unit.sub_specialty_id).all()
        sub_specialty_clashing_groups = session.query(SubSpecialtiesClashingGroups).where(
            SubSpecialtiesClashingGroups.sub_specialty_id == unit.sub_specialty_id).all()
        unit.ot_types = transform_ot_types(sub_specialty_ot_type, session)
        unit.fixed_ots = [
            {'value': fot.ot_id, 'label': fot.ot_id}
            for fot in unit.fixed_ot
        ]
        unit.fixed_ot_opt = [
            {'value': ot.id, 'label': ot.id}
            for ot in all_ots
        ]
        unit.blocked_ots = [
            {'value': bot.ot_id, 'label': bot.ot_id}
            for bot in unit.blocked_ot
        ]
        unit.blocked_ot_opt = [
            {'value': ot.id, 'label': ot.id}
            for ot in all_ots
        ]
        unit.preferred_ots = [
            {'value': pot.ot_id, 'label': pot.ot_id}
            for pot in unit.preferred_ot
        ]
        unit.preferred_ot_opt = [
            {'value': ot.id, 'label': ot.id}
            for ot in all_ots
        ]
        unit.blocked_days = [
            {
                'value': bday.day_id,
                'label': day_mapping.get(bday.day_id, 'Unknown')
            }
            for bday in unit.blocked_day
        ]
        unit.blocked_day_opt = [
            {'value': day.id, 'label': day.name}
            for day in all_days
        ]
        unit.equipment_requirements = [
            {
                'value': er_msp.equipment_id,
                'label': er_msp_mapping.get(er_msp.equipment_id, 'Unknown')
            }
            for er_msp in unit.equipment_requirement
        ]
        unit.equipment_requirement_opt = [
            {'value': equipment_msp.id, 'label': equipment_msp.name}
            for equipment_msp in all_equipment_msp
        ]
        unit.sub_specialtys = [
            {
                'value': sscg.id,
                'label': sub_specialty_mappintg.get(sscg.id, 'Unknown')
            }
            for sscg in sub_specialty_clashing_groups
        ]
        unit.sub_specialty_opt = [
            {'value': ssp.id, 'label': ssp.description}
            for ssp in all_sub_specialty
        ]

    return {
        'data': {
            'constraints': units,
            'objective': objectives
        }
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
def set_constraints(ins_constraints: InsertConstraintsSchema, session: Session = Depends(get_db), token: str = Depends(TokenAuthorization)):
    truncate_tables = [
        'sub_specialties_ot_types',
        'blocked_day',
        'blocked_ot',
        'fixed_ot',
        'preferred_ot',
        'sub_specialties_clashing_groups',
        'clashing_groups'
    ]
    session.execute('SET FOREIGN_KEY_CHECKS = 0;')
    for table in truncate_tables:
        session.execute(f'TRUNCATE TABLE {table}')
    session.execute('SET FOREIGN_KEY_CHECKS = 1;')
    session.commit()

    for constraint in ins_constraints.insConstraints:
        unit_data = session.query(Unit).get(constraint.id)
        if constraint.no_of_slots >= constraint.max_slot_limit:
            constraint.no_of_slots = constraint.max_slot_limit
        if unit_data is not None:
            unit_data.max_slot_limit = constraint.max_slot_limit
            unit_data.no_of_slots = constraint.no_of_slots
            session.commit()
            session.refresh(unit_data)


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
