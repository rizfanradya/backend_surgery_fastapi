from datetime import time, datetime
from typing import List
from models.schedule_results import ScheduleResults


def next_available_time(
    schedule_results: List[ScheduleResults],
    surgery_date: datetime,
    ot_id: int,
    category: str
) -> time:
    relevant_schedules = [
        result for result in schedule_results
        if result.surgery_date == surgery_date.date() and result.ot_id == ot_id  # type: ignore
    ]
    if not relevant_schedules:
        return time(8, 0)
    return max(
        getattr(result, f"{category}_end_time") for result in relevant_schedules
    )
