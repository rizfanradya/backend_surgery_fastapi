from fastapi import APIRouter
import api.user as user
import api.auth as auth
import api.generate_masterplan as generate_masterplan
import api.generate_daily_schedule as generate_daily_schedule
import api.backup as backup
import api.procedure_name as procedure_name
import api.ot as ot
router = APIRouter()

router.include_router(auth.router, tags=["Auth API"], prefix="/api")
router.include_router(user.router, tags=["User API"], prefix="/api")
router.include_router(
    procedure_name.router,
    tags=["Procedure Name API"],
    prefix="/api"
)
router.include_router(ot.router, tags=["Ot API"], prefix="/api")
router.include_router(
    generate_masterplan.router,
    tags=["Generate Master Plan API"],
    prefix="/api/masplan"
)
router.include_router(
    generate_daily_schedule.router,
    tags=["Generate Daily Schedule API"],
    prefix="/api/schedule"
)
router.include_router(backup.router, tags=["Backup API"], prefix="/api/backup")
