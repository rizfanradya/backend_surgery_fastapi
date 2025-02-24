from logging.config import fileConfig
from sqlalchemy import engine_from_config
from sqlalchemy import pool
from alembic import context
from utils.database import DATABASE_URL, Base

from models.user import *
from models.role import *
from models.surgery import *
from models.masterplan import *
from models.procedure_name import *
from models.ot import *
from models.unit import *
from models.ot_assignment import *
from models.week import *
from models.day import *
from models.ot_type import *
from models.status import *
from models.sub_specialty import *
from models.specialty import *
from models.objectives import *
from models.equipment_msp import *
from models.fixed_ot import *
from models.blocked_ot import *
from models.preferred_ot import *
from models.blocked_day import *
from models.equipment_requirement_status import *
from models.equipment import *
from models.equipment_requirement import *
from models.sub_specialties_ot_types import *
from models.schedule_results import *
from models.clashing_subspecialties import *
from models.schedule_resource import *
from models.month import *
from models.schedule_queue import *

# this is the Alembic Config object, which provides
# access to the values within the .ini file in use.
config = context.config
config.set_main_option('sqlalchemy.url', DATABASE_URL)

# Interpret the config file for Python logging.
# This line sets up loggers basically.
if config.config_file_name is not None:
    fileConfig(config.config_file_name)

# add your model's MetaData object here
# for 'autogenerate' support
# from myapp import mymodel
# target_metadata = mymodel.Base.metadata
target_metadata = Base.metadata  # type: ignore

# other values from the config, defined by the needs of env.py,
# can be acquired:
# my_important_option = config.get_main_option("my_important_option")
# ... etc.


def run_migrations_offline() -> None:
    """Run migrations in 'offline' mode.

    This configures the context with just a URL
    and not an Engine, though an Engine is acceptable
    here as well.  By skipping the Engine creation
    we don't even need a DBAPI to be available.

    Calls to context.execute() here emit the given string to the
    script output.

    """
    url = config.get_main_option("sqlalchemy.url")
    context.configure(
        url=url,
        target_metadata=target_metadata,
        literal_binds=True,
        dialect_opts={"paramstyle": "named"},
    )

    with context.begin_transaction():
        context.run_migrations()


def run_migrations_online() -> None:
    """Run migrations in 'online' mode.

    In this scenario we need to create an Engine
    and associate a connection with the context.

    """
    connectable = engine_from_config(
        config.get_section(config.config_ini_section, {}),
        prefix="sqlalchemy.",
        poolclass=pool.NullPool,
    )

    with connectable.connect() as connection:  # type: ignore
        context.configure(
            connection=connection, target_metadata=target_metadata
        )

        with context.begin_transaction():
            context.run_migrations()


if context.is_offline_mode():
    run_migrations_offline()
else:
    run_migrations_online()
