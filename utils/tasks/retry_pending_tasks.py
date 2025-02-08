from utils.celery import celery
from celery.result import AsyncResult


@celery.task(name="utils.tasks.retry_pending_tasks")
def retry_pending_tasks():
    inspector = celery.control.inspect()
    scheduled_tasks = inspector.scheduled() or {}
    reserved_tasks = inspector.reserved() or {}

    if not scheduled_tasks and not reserved_tasks:
        print("No pending tasks to retry.")
        return

    print("Retrying pending tasks...")

    for worker, tasks in {**scheduled_tasks, **reserved_tasks}.items():
        for task in tasks:
            task_name = task.get("name")
            task_id = task.get("request", {}).get("id") or task.get("id")

            if task_name and task_id:
                result = AsyncResult(task_id)

                if result.state in ["PENDING", "RETRY"]:
                    print(f"Retrying task: {task_name} (ID: {task_id})")

                    celery.send_task(
                        task_name, task_id=task_id, kwargs=result.kwargs or {})
