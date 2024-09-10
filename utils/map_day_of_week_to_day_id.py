from sqlalchemy.orm import Session
from sqlalchemy.exc import NoResultFound
from models.day import Day
from .parse_date import parse_date


def map_day_of_week_to_day_id(date: str, session: Session) -> int:
    parsed_date = parse_date(date)
    day_of_week = parsed_date.weekday()
    day_mapping = {
        0: 'Mon',
        1: 'Tue',
        2: 'Wed',
        3: 'Thu',
        4: 'Fri'
    }
    day_name = day_mapping.get(day_of_week, 'Unknown')
    if day_name == 'Unknown':
        return 0
    try:
        day = session.query(Day).where(Day.name.ilike(day_name)).one()
        return day.id
    except NoResultFound:
        return 0
