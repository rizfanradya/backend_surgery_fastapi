from utils.celery import celery
from utils.database import get_db_session
from utils.retrieve.status import retrieve_status
from utils.remove_orphaned_files import check_and_remove_orphaned_files
from models.masterplan import Masterplan
from models.ot_assignment import OtAssignment
from models.surgery import Surgery


@celery.task(bind=True, name="utils.tasks.purge_failed_queues_mssp")
def purge_failed_queues_mssp_task(self):
    with get_db_session() as session:
        try:
            status_failed = retrieve_status('failed', session)
            query_mssp = session.query(Masterplan.id).where(
                Masterplan.status_id == status_failed.id)
            session.query(OtAssignment).where(OtAssignment.mssp_id.in_(
                query_mssp)).delete(synchronize_session=False)
            session.query(Surgery).where(Surgery.mssp_id.in_(
                query_mssp)).delete(synchronize_session=False)
            deleted_rows = session.query(Masterplan).where(
                Masterplan.status_id == status_failed.id).delete(synchronize_session=False)
            session.commit()
            check_and_remove_orphaned_files()
            if deleted_rows == 0:
                return {"status": "info", "message": "No failed queues found"}
            return {"status": "success", "message": f"Deleted {deleted_rows} failed queues and related data"}
        except Exception as error:
            return {"status": "error", "message": str(error)}
