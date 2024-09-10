from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
from utils.config import SERVER_PORT
from utils.router import router
from utils.run_shell_command import run_shell_commands
from utils.data_must_exist_db import data_that_must_exist_in_the_database
from utils.remove_orphaned_files import check_and_remove_orphaned_files
from apscheduler.schedulers.background import BackgroundScheduler

# FastAPI instance
app = FastAPI(
    title="App Surgery FastAPI",
)

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

app.include_router(router)

# scheduler
scheduler = BackgroundScheduler()
scheduler.add_job(check_and_remove_orphaned_files, 'interval', hours=1)
scheduler.add_job(data_that_must_exist_in_the_database, 'interval', days=1)
scheduler.start()


@app.get("/")
def root():
    data_that_must_exist_in_the_database()
    check_and_remove_orphaned_files()
    return {"message": "HCTM Surgery API"}


# run the server
if __name__ == "__main__":
    run_shell_commands()
    data_that_must_exist_in_the_database()
    check_and_remove_orphaned_files()
    uvicorn.run(
        "app:app", host="0.0.0.0",
        reload=True,
        port=int(SERVER_PORT)  # type: ignore
    )
