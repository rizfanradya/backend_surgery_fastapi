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
]

sorted_routers = sorted(routers, key=lambda x: x[1])
router = APIRouter()
for router_instance, tag, prefix in sorted_routers:
    router.include_router(router_instance, tags=[tag], prefix=prefix)
