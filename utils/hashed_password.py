from bcrypt import hashpw, gensalt
from .error_response import send_error_response
from password_validator import PasswordValidator


def hashed_password(password: str) -> str:
    schema_password_validator = PasswordValidator()
    schema_password_validator.min(8).has().uppercase(
    ).has().lowercase().has().digits().has().symbols()

    if not schema_password_validator.validate(password):
        send_error_response(
            "Password must consist of at least 8 characters, contain at least one uppercase letter, one lowercase letter, one digit, one special character or symbol, and cannot contain spaces"
        )

    salt = gensalt()
    password_encode = password.encode('utf-8')
    hash_password = hashpw(password_encode, salt)
    hash_password = hash_password.decode('utf-8')
    return hash_password
