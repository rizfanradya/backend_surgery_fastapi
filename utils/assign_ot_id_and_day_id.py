from sqlalchemy.orm import Session
from models.ot import Ot
from models.day import Day


def assign_ot_id_and_day_id(
    session: Session,
    ot_assignments,
):
    available_ots = session.query(Ot.id).all()
    if not available_ots:
        return None, None
    available_ot_ids = [ot.id for ot in available_ots]

    available_days = session.query(Day.id).all()
    if not available_days:
        return None, None
    available_day_ids = [day.id for day in available_days]

    assigned_ots = {
        (assignment.ot_id, assignment.day_id)
        for assignment in ot_assignments
    }

    for day_id in available_day_ids:
        for ot_id in available_ot_ids:
            if (ot_id, day_id) not in assigned_ots:
                return ot_id, day_id

    return None, None
