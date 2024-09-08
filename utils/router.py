from fastapi import APIRouter
import api.user as user
import api.auth as auth
import api.generate_masterplan as generate_masterplan

router = APIRouter()

router.include_router(auth.router, tags=["Auth API"], prefix="/api")
router.include_router(user.router, tags=["User API"], prefix="/api")
router.include_router(
    generate_masterplan.router,
    tags=["Generate Masterplan API"],
    prefix="/api/masplan"
)
