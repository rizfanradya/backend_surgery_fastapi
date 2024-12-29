from sqlalchemy.orm import Session
from sqlalchemy.exc import NoResultFound
from models.day import Day
from .parse_date import parse_date


def map_day_of_week_to_day_id(date: str, session: Session) -> int:
    parsed_date = parse_date(date)
    day_of_week = parsed_date.weekday()
    day_mapping = {
        0: 'Monday',
        1: 'Tuesday',
        2: 'Wednesday',
        3: 'Thursday',
        4: 'Friday'
    }
    day_name = day_mapping.get(day_of_week, 'Unknown')
    if day_name == 'Unknown':
        return 0
    try:
        day = session.query(Day).where(Day.name.ilike(day_name)).one()
        return day.id  # type: ignore
    except NoResultFound:
        return 0
