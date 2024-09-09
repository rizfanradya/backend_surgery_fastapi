from fastapi import APIRouter
import api.user as user
import api.auth as auth
import api.generate_masterplan as generate_masterplan
import api.generate_daily_schedule as generate_daily_schedule
import api.backup as backup
import api.procedure_name as procedure_name
import api.ot as ot
import api.unit as unit
import api.ot_assignment as ot_assignment
import api.week as week
import api.day as day
import api.ot_type as ot_type
import api.status as status
import api.masterplan as masterplan
import api.sub_specialty as sub_specialty
import api.specialty as specialty
import api.objectives as objectives
import api.clashing_groups as clashing_groups
import api.equipment_msp as equipment_msp
import api.fixed_ot as fixed_ot
import api.blocked_ot as blocked_ot
import api.preferred_ot as preferred_ot
import api.blocked_day as blocked_day
import api.equipment_requirement_status as equipment_requirement_status
import api.equipment as equipment
import api.equipment_requirement as equipment_requirement

routers = [
    (auth.router, "Auth API", "/api"),
    (user.router, "User API", "/api"),
    (procedure_name.router, "Procedure Name API", "/api"),
    (ot.router, "Ot API", "/api"),
    (unit.router, "Unit API", "/api"),
    (ot_assignment.router, "Ot Assignment API", "/api"),
    (week.router, "Week API", "/api"),
    (generate_masterplan.router, "Generate Master Plan API", "/api/masplan"),
    (generate_daily_schedule.router, "Generate Daily Schedule API", "/api/schedule"),
    (backup.router, "Backup API", "/api/backup"),
    (day.router, "Day API", "/api"),
    (ot_type.router, "Ot Type API", "/api"),
    (status.router, "Status API", "/api"),
    (masterplan.router, "Master Plan API", "/api"),
    (sub_specialty.router, "Sub Specialty API", "/api"),
    (specialty.router, "Specialty API", "/api"),
    (objectives.router, "Objectives API", "/api"),
    (clashing_groups.router, "Clashing Groups API", "/api"),
    (equipment_msp.router, "Equipment Msp API", "/api"),
    (fixed_ot.router, "Fixed Ot API", "/api"),
    (blocked_ot.router, "Blocked Ot API", "/api"),
    (preferred_ot.router, "Preferred Ot API", "/api"),
    (blocked_day.router, "Blocked Day API", "/api"),
    (equipment.router, "Equipment API", "/api"),
    (equipment_requirement.router, "Equipment Requirement API", "/api"),
    (
        equipment_requirement_status.router,
        "Equipment Requirement Status API",
        "/api"
    ),
]

sorted_routers = sorted(routers, key=lambda x: x[1])
router = APIRouter()
for router_instance, tag, prefix in sorted_routers:
    router.include_router(router_instance, tags=[tag], prefix=prefix)
