from datetime import datetime


def parse_date(date_str):
    formats = [
        "%m/%d/%Y", "%m/%d/%y", "%m-%d-%y", "%Y-%m-%d", "%Y-%m-%d %H:%M:%S", "%Y-%m-%d %H:%M:%S.%f"
    ]
    for fmt in formats:
        try:
            return datetime.strptime(str(date_str), fmt)
        except ValueError:
            continue
    raise ValueError(f"Date '{date_str}' does not match any of the formats")
