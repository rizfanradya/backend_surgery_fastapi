from datetime import date, timedelta


def calculate_week_name(date_in):
    first_day_of_month = date(date_in.year, date_in.month, 1)
    first_monday_of_month = first_day_of_month + timedelta(
        days=(7 - first_day_of_month.weekday()) % 7
    )
    last_day_prev_month = first_day_of_month - timedelta(days=1)
    last_monday_prev_month = last_day_prev_month - timedelta(
        days=last_day_prev_month.weekday()
    )
    if date_in < first_monday_of_month and date_in >= last_monday_prev_month:
        return calculate_week_name(last_monday_prev_month)
    week_number = ((date_in - first_monday_of_month).days // 7) + 1
    return f"Week {week_number}"
