from celery import Celery
from .config import REDIS_URL

celery = Celery(
    "tasks",
    broker=REDIS_URL,
    backend=REDIS_URL
)

celery.conf.update(
    task_serializer='json',
    accept_content=['json'],
    result_expires=3600,
)
