def to_camel_case(s: str) -> str:
    camel = []
    upper_next = False
    for i, v in enumerate(s):
        if v.isalnum():
            if upper_next:
                camel.append(v.upper())
                upper_next = False
            else:
                camel.append(v.lower() if i == 0 else v)
        else:
            upper_next = True
    return ''.join(camel)
