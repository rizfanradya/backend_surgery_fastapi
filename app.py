from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
from utils.config import SERVER_PORT
from utils.router import router
from utils.run_shell_command import run_shell_commands
from utils.data_must_exist_db import data_that_must_exist_in_the_database

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


@app.get("/")
def root():
    data_that_must_exist_in_the_database()
    return {"message": "HCTM Surgery API"}


# run the server
if __name__ == "__main__":
    run_shell_commands()
    data_that_must_exist_in_the_database()
    uvicorn.run(
        "app:app", host="0.0.0.0",
        reload=True,
        port=int(SERVER_PORT)  # type: ignore
    )
