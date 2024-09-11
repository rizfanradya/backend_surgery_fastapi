from fastapi import APIRouter, Depends, File, UploadFile, Form
from fastapi.responses import StreamingResponse
from sqlalchemy.orm import Session, joinedload
from utils.database import get_db
from utils.auth import TokenAuthorization
from utils.transform_ot_type import transform_ot_types
from utils.error_response import send_error_response
from utils.parse_date import parse_date
from utils.map_day_of_week_to_day_id import map_day_of_week_to_day_id
from typing import Literal, Optional
from sqlalchemy import asc, desc, func
from io import BytesIO
from datetime import datetime, date as dt_datetime
from openpyxl import load_workbook, Workbook
import os
from schemas.generate_masterplan import UpdateObjectivesWeightsSchema, ConstraintsResponseSchema, InsertConstraintsSchema
from schemas.sub_specialties_ot_types import SubSpecialtiesOtTypesSchema
from schemas.fixed_ot import FixedOtSchema
from schemas.blocked_ot import BlockedOtSchema
from schemas.preferred_ot import PreferredOtSchema
from schemas.blocked_day import BlockedDaySchema
from schemas.equipment_requirement import EquipmentRequirementSchema
from schemas.clashing_groups import ClashingGroupsSchema
from schemas.sub_specialties_clashing_groups import SubSpecialtiesClashingGroupsSchema
from schemas.masterplan import MasterPlanSchema
from schemas.surgery import SurgerySchema
from schemas.ot_assignment import OtAssignmentSchema
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
from models.fixed_ot import FixedOt
from models.blocked_ot import BlockedOt
from models.preferred_ot import PreferredOt
from models.blocked_day import BlockedDay
from models.equipment_requirement import EquipmentRequirement
from models.equipment_requirement_status import EquipmentRequirementStatus
from models.equipment import Equipment
from models.clashing_groups import ClashingGroups
from models.surgery import Surgery

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
    sub_specialty_mapping = {
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

        unique_sub_specialties = set()
        for sscg in sub_specialty_clashing_groups:
            unique_sub_specialties.add(sscg.sub_specialty_id)
        unit.sub_specialtys = [
            {
                'value': ssp_id,
                'label': sub_specialty_mapping.get(ssp_id, 'Unknown')
            }
            for ssp_id in unique_sub_specialties
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
            data.weight = 100 if update.weight >= 100 else update.weight
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
        'equipment_requirement',
        'clashing_groups',
    ]

    for constraint in ins_constraints.insConstraints:
        if not any(item.value for key, item in constraint.ot_types.items()):
            send_error_response(
                'At least one ot type should be selected for each unit.'
            )

        blocked_ot_ids = {
            blocked_ot.value for blocked_ot in constraint.blocked_ots
        }
        preferred_ot_ids = {
            preferred_ot.value for preferred_ot in constraint.preferred_ots
        }
        intersection = blocked_ot_ids.intersection(preferred_ot_ids)
        if intersection:
            send_error_response(
                f'Blocked OT and Preferred OT cannot have the same IDs: {
                    intersection}'
            )

    fixed_ot_type = session.query(OtType).where(
        OtType.description.like('%fix%')).first()
    ers_used_by_some = session.query(EquipmentRequirementStatus).where(
        EquipmentRequirementStatus.description.like('%used by some%')).first()

    if fixed_ot_type is None or ers_used_by_some is None:
        send_error_response(
            'Fixed ot type or equipment requirement status not found in database.'
        )

    session.execute('SET FOREIGN_KEY_CHECKS = 0;')
    for table in truncate_tables:
        session.execute(f'TRUNCATE TABLE {table}')
    session.execute('SET FOREIGN_KEY_CHECKS = 1;')
    session.commit()

    for constraint in ins_constraints.insConstraints:
        unit_data = session.query(Unit).get(constraint.id)
        if unit_data is not None:
            unit_data.max_slot_limit = constraint.max_slot_limit
            unit_data.no_of_slots = constraint.max_slot_limit if constraint.no_of_slots >= constraint.max_slot_limit else constraint.no_of_slots
            session.commit()
            session.refresh(unit_data)

            if fixed_ot_type and any(item.value for key, item in constraint.ot_types.items() if item.id == fixed_ot_type.id):
                for key, item in constraint.ot_types.items():
                    if item.id != fixed_ot_type.id:
                        item.value = False

                fixed_ot_ids = set()
                for fixed_ot in constraint.fixed_ots:
                    ot_data = session.query(Ot).get(fixed_ot.value)
                    if ot_data is not None and fixed_ot.value not in fixed_ot_ids:
                        fixed_ot_schema = FixedOtSchema(
                            unit_id=constraint.id,
                            ot_id=fixed_ot.value
                        )
                        new_fixed_ot = FixedOt(**fixed_ot_schema.dict())
                        session.add(new_fixed_ot)
                        session.commit()
                        session.refresh(new_fixed_ot)
                        fixed_ot_ids.add(fixed_ot.value)
            else:
                blocked_ot_ids = set()
                for blocked_ot in constraint.blocked_ots:
                    ot_data = session.query(Ot).get(blocked_ot.value)
                    if ot_data is not None and blocked_ot.value not in blocked_ot_ids:
                        blocked_ot_schema = BlockedOtSchema(
                            unit_id=constraint.id,
                            ot_id=blocked_ot.value
                        )
                        new_blocked_ot = BlockedOt(**blocked_ot_schema.dict())
                        session.add(new_blocked_ot)
                        session.commit()
                        session.refresh(new_blocked_ot)
                        blocked_ot_ids.add(blocked_ot.value)

                preferred_ot_ids = set()
                for preferred_ot in constraint.preferred_ots:
                    ot_data = session.query(Ot).get(preferred_ot.value)
                    if ot_data is not None and preferred_ot.value not in preferred_ot_ids:
                        preferred_ot_schema = PreferredOtSchema(
                            unit_id=constraint.id,
                            ot_id=preferred_ot.value
                        )
                        new_preferred_ot = PreferredOt(
                            **preferred_ot_schema.dict()
                        )
                        session.add(new_preferred_ot)
                        session.commit()
                        session.refresh(new_preferred_ot)
                        preferred_ot_ids.add(preferred_ot.value)

            for key, item in constraint.ot_types.items():
                ot_type_data = session.query(OtType).get(item.id)
                if item.value and ot_type_data is not None:
                    new_sub_specialties_ot_types_schema = SubSpecialtiesOtTypesSchema(
                        sub_specialty_id=unit_data.sub_specialty_id,
                        ot_type_id=item.id
                    )
                    new_sub_specialties_ot_types = SubSpecialtiesOtTypes(
                        **new_sub_specialties_ot_types_schema.dict()
                    )
                    session.add(new_sub_specialties_ot_types)
                    session.commit()
                    session.refresh(new_sub_specialties_ot_types)

            blocked_day_ids = set()
            for blocked_day in constraint.blocked_days:
                day_data = session.query(Day).get(blocked_day.value)
                if day_data is not None and blocked_day.value not in blocked_day_ids:
                    blocked_day_schema = BlockedDaySchema(
                        unit_id=constraint.id,
                        day_id=blocked_day.value
                    )
                    new_blocked_day = BlockedDay(**blocked_day_schema.dict())
                    session.add(new_blocked_day)
                    session.commit()
                    session.refresh(new_blocked_day)
                    blocked_day_ids.add(blocked_day.value)

            equipment_ids = set()
            for equipment_requirement in constraint.equipment_requirements:
                equipment_data = session.query(Equipment).get(
                    equipment_requirement.value)
                if equipment_data is not None and equipment_requirement.value not in equipment_ids:
                    equipment_requirement_schema = EquipmentRequirementSchema(
                        unit_id=constraint.id,
                        equipment_id=equipment_requirement.value,
                        equipment_requirement_status_id=ers_used_by_some.id
                    )
                    new_equipment_requirement = EquipmentRequirement(
                        **equipment_requirement_schema.dict()
                    )
                    session.add(new_equipment_requirement)
                    session.commit()
                    session.refresh(new_equipment_requirement)
                    equipment_ids.add(equipment_requirement.value)

            clashing_group_ids = []
            unique_sub_specialties = set()
            sub_specialty_ids = [unit_data.sub_specialty_id]
            for sub_specialty in constraint.sub_specialtys:
                if sub_specialty.value not in unique_sub_specialties:
                    unique_sub_specialties.add(sub_specialty.value)
            for value in list(unique_sub_specialties)[:2]:
                sub_specialty_data = session.query(
                    SubSpecialty).get(value)
                if sub_specialty_data is not None:
                    sub_specialty_ids.append(value)
            for i in range(len(sub_specialty_ids)):
                for j in range(i + 1, len(sub_specialty_ids)):
                    new_clashing_group_schema = ClashingGroupsSchema(
                        description=f"Clashing Group: {
                            sub_specialty_ids[i]} and {sub_specialty_ids[j]}"
                    )
                    new_clashing_group = ClashingGroups(
                        **new_clashing_group_schema.dict()
                    )
                    session.add(new_clashing_group)
                    session.commit()
                    session.refresh(new_clashing_group)
                    clashing_group_ids.append(new_clashing_group.id)
            for clashing_group_id in clashing_group_ids:
                for sub_specialty_id in sub_specialty_ids:
                    new_sub_specialties_clashing_group_schema = SubSpecialtiesClashingGroupsSchema(
                        sub_specialty_id=sub_specialty_id,
                        clashing_group_id=clashing_group_id
                    )
                    new_sub_specialties_clashing_group = SubSpecialtiesClashingGroups(
                        **new_sub_specialties_clashing_group_schema.dict()
                    )
                    session.add(new_sub_specialties_clashing_group)
                    session.commit()
                    session.refresh(new_sub_specialties_clashing_group)
    return {'message': 'Constraints updated successfully.'}


@router.post('/generate')
def generate_masterplan(
    start_date: dt_datetime = Form(...),
    end_date: dt_datetime = Form(...),
    file: UploadFile = File(...),
    session: Session = Depends(get_db),
    token: str = Depends(TokenAuthorization)
):
    check_excell_format(file, session, token)
    file.file.seek(0)

    start_date_str = parse_date(start_date)
    end_date_str = parse_date(end_date)

    total_weight, num_objectives = session.query(
        func.sum(Objectives.weight),
        func.count(Objectives.id)
    ).one()
    average_weight_obj = total_weight / num_objectives if num_objectives > 0 else 0
    current_timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    last_id = session.query(Masterplan).order_by(
        Masterplan.id.desc()).first()  # type: ignore
    get_last_id = last_id.id+1 if last_id else 1
    mssp_desc = f'MSSP: {get_last_id} generated at {current_timestamp}'

    new_masterplan_schema = MasterPlanSchema(
        description=mssp_desc,
        objective_value=average_weight_obj,
    )
    new_masterplan = Masterplan(**new_masterplan_schema.dict())
    session.add(new_masterplan)
    session.commit()
    session.refresh(new_masterplan)

    abs_path = os.path.abspath(__file__)
    base_dir = os.path.dirname(os.path.dirname(abs_path))
    upload_dir = os.path.join(base_dir, 'uploads', 'masterplan')
    os.makedirs(upload_dir, exist_ok=True)
    file_extension = file.filename.split('.')[-1]  # type: ignore
    filename = f'{new_masterplan.id}.{file_extension}'
    file_path = os.path.join(upload_dir, filename)
    try:
        with open(file_path, 'wb') as f:
            f.write(file.file.read())
    except Exception as error:
        send_error_response(str(error), 'Failed to save file')
    file.file.seek(0)
    new_masterplan.uploaded_file = filename
    session.commit()
    session.refresh(new_masterplan)

    procedure_names = session.query(ProcedureName).all()
    units = session.query(Unit).all()
    ots = session.query(Ot).all()
    procedure_name_map = {p.name: p.id for p in procedure_names}
    unit_name_map = {u.name: u.id for u in units}
    ot_name_map = {o.name: o.id for o in ots}

    clashing_groups = session.query(SubSpecialtiesClashingGroups).options(
        joinedload(SubSpecialtiesClashingGroups.clashing_groups)
    ).all()  # type: ignore
    clashing_group_map = {}
    for cg in clashing_groups:
        if cg.sub_specialty_id not in clashing_group_map:
            clashing_group_map[cg.sub_specialty_id] = []
        clashing_group_map[cg.sub_specialty_id].append(cg.clashing_group_id)

    contents = file.file.read()
    excel_data = BytesIO(contents)
    workbook = load_workbook(excel_data)
    sheet = workbook.active

    for row_idx, row in enumerate(
        sheet.iter_rows(min_row=2, values_only=True),  # type: ignore
        start=2
    ):
        try:
            booking_date = parse_date(row[0])
        except ValueError as error:
            send_error_response(
                f"Invalid date format for booking date: {error}")

        if booking_date < start_date_str or booking_date > end_date_str:
            continue

        try:
            operation_date = parse_date(row[1])
        except ValueError as error:
            send_error_response(
                f"Invalid date format for operation date: {error}")

        try:
            age = int(str(row[3]))
        except ValueError as error:
            send_error_response(f"Invalid age format: {error}")

        try:
            duration = int(str(row[14]))
        except ValueError as error:
            send_error_response(f"Invalid duration format: {error}")

        procedure_name_id = procedure_name_map.get(row[13], 0)
        unit_id = unit_name_map.get(row[10], 0)
        ot_id = ot_name_map.get(str(row[12]), 0)
        day_id = map_day_of_week_to_day_id(str(operation_date), session)

        if ot_id == 0:
            continue
        if day_id == 0:
            continue

        for sub_specialty_id, clashing_ids in clashing_group_map.items():
            if unit_id in clashing_ids:
                send_error_response(
                    f"Clashing detected for subspecialty {sub_specialty_id} with unit {unit_id}")

        surgery_schema = SurgerySchema(
            mrn=str(row[2]),
            unit_id=unit_id,
            booking_date=booking_date,
            estimated_duration=duration,
            procedure_name_id=procedure_name_id,
            age=age,
            gender_code='P' if isinstance(
                row[4], str) and row[4].upper() == 'P' else 'L',
            surgeon=str(row[16])
        )
        ot_assignment_schema = OtAssignmentSchema(
            mssp_id=new_masterplan.id,
            week_id=1,
            ot_id=ot_id,
            unit_id=unit_id,
            day_id=day_id,
            is_require_anaes=True if row[8] == 'Y'else False,
            opening_time=datetime.strptime(
                '09:00:00.0000', '%H:%M:%S.%f').time(),
            closing_time=datetime.strptime(
                '16:00:00.0000', '%H:%M:%S.%f').time()
        )

        new_surgery = Surgery(**surgery_schema.dict())
        new_ot_assignment = OtAssignment(**ot_assignment_schema.dict())
        session.add(new_surgery)
        session.add(new_ot_assignment)
        session.commit()
        session.commit()
        session.refresh(new_surgery)
        session.refresh(new_ot_assignment)

    new_masterplan.id
    return new_masterplan


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
