from datetime import datetime, timedelta, time


def add_duration(start_time: str, duration: int, timezone) -> time:
    start = datetime.strptime(start_time, '%H:%M').time()
    start_dt = datetime.combine(datetime.now(timezone), start)
    end_dt = start_dt + timedelta(minutes=duration)
    return end_dt.time()
