from utils.celery import celery
from utils.database import get_db_session
from utils.retrieve.status import retrieve_status
from utils.remove_orphaned_files import check_and_remove_orphaned_files
from models.schedule_results import ScheduleResults
from models.schedule_queue import ScheduleQueue


@celery.task(bind=True, name="utils.tasks.purge_failed_queues_schedule")
def purge_failed_queues_schedule_task(self):
    with get_db_session() as session:
        try:
            status_failed = retrieve_status('failed', session)
            session.query(ScheduleResults).where(
                ScheduleResults.schedule_queue_id.in_(
                    session.query(ScheduleQueue.id).where(
                        ScheduleQueue.status_id == status_failed.id
                    )
                )
            ).delete(synchronize_session=False)
            deleted_rows = session.query(ScheduleQueue).where(
                ScheduleQueue.status_id == status_failed.id
            ).delete(synchronize_session=False)
            session.commit()
            check_and_remove_orphaned_files()
            if deleted_rows == 0:
                return {"status": "info", "message": "No failed queues found"}
            return {"status": "success", "message": f"Deleted {deleted_rows} failed queues"}
        except Exception as error:
            return {"status": "error", "message": str(error)}
