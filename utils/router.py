from fastapi import APIRouter
import api.user as user
import api.auth as auth
import api.generate_masterplan as generate_masterplan
import api.generate_daily_schedule as generate_daily_schedule
import api.settings_server as settings_server
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
import api.equipment_msp as equipment_msp
import api.fixed_ot as fixed_ot
import api.blocked_ot as blocked_ot
import api.preferred_ot as preferred_ot
import api.blocked_day as blocked_day
import api.equipment_requirement_status as equipment_requirement_status
import api.equipment as equipment
import api.equipment_requirement as equipment_requirement
import api.sub_specialties_ot_types as sub_specialties_ot_types
import api.surgery as surgery
import api.schedule_results as schedule_results
import api.role as role
import api.clashing_subspecialties as clashing_subspecialties
import api.schedule_resource as schedule_resource
import api.month as month
import api.schedule_queue as schedule_queue

routers = [
    (auth.router, "Auth API", "/api"),
    (role.router, "Role API", "/api"),
    (user.router, "User API", "/api"),
    (procedure_name.router, "Procedure Name API", "/api"),
    (ot.router, "Ot API", "/api"),
    (unit.router, "Unit API", "/api"),
    (ot_assignment.router, "Ot Assignment API", "/api"),
    (week.router, "Week API", "/api"),
    (month.router, "Month API", "/api"),
    (generate_masterplan.router, "Generate Master Plan API", "/api/masplan"),
    (generate_daily_schedule.router, "Generate Daily Schedule API", "/api/schedule"),
    (settings_server.router, "Settings Server API", "/api"),
    (day.router, "Day API", "/api"),
    (ot_type.router, "Ot Type API", "/api"),
    (status.router, "Status API", "/api"),
    (masterplan.router, "Master Plan API", "/api"),
    (sub_specialty.router, "Sub Specialty API", "/api"),
    (specialty.router, "Specialty API", "/api"),
    (objectives.router, "Objectives API", "/api"),
    (equipment_msp.router, "Equipment Msp API", "/api"),
    (fixed_ot.router, "Fixed Ot API", "/api"),
    (blocked_ot.router, "Blocked Ot API", "/api"),
    (preferred_ot.router, "Preferred Ot API", "/api"),
    (blocked_day.router, "Blocked Day API", "/api"),
    (equipment.router, "Equipment API", "/api"),
    (surgery.router, "Surgery API", "/api"),
    (schedule_results.router, "Schedule Results API", "/api"),
    (clashing_subspecialties.router, "Clashing Sub Specialties API", "/api"),
    (equipment_requirement.router, "Equipment Requirement API", "/api"),
    (schedule_resource.router, "Schedule Resource API", "/api"),
    (schedule_queue.router, "Schedule Queue API", "/api"),
    (
        equipment_requirement_status.router,
        "Equipment Requirement Status API",
        "/api"
    ),
    (
        sub_specialties_ot_types.router,
        "Sub Specialties Ot Types API",
        "/api"
    ),
]

sorted_routers = sorted(routers, key=lambda x: x[1])
router = APIRouter()
for router_instance, tag, prefix in sorted_routers:
    router.include_router(router_instance, tags=[tag], prefix=prefix)
