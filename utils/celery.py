import os
import importlib
from celery import Celery
from .config import REDIS_URL
from celery.schedules import crontab

celery = Celery(
    "tasks",
    broker=REDIS_URL,
    backend=REDIS_URL
)

celery.conf.update(
    task_serializer="json",
    accept_content=["json"],
    result_expires=3600,
    worker_prefetch_multiplier=1,
    task_acks_late=True,
    broker_heartbeat=10,
)

celery.conf.beat_schedule = {
    'retry_pending_tasks': {
        'task': 'utils.tasks.retry_pending_tasks',
        'schedule': crontab(minute="*/5"),
    },
}


TASKS_PATH = "utils.tasks"


def auto_discover_tasks():
    tasks_dir = os.path.join(os.path.dirname(__file__), "tasks")
    for filename in os.listdir(tasks_dir):
        if filename.endswith(".py") and filename != "__init__.py":
            module_name = f"{TASKS_PATH}.{filename[:-3]}"
            importlib.import_module(module_name)


auto_discover_tasks()
