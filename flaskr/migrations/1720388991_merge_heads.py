"""merge heads

Revision ID: 1720388991
Revises: 1720387068, 1720387891, 1720388849
Create Date: 2024-07-07 21:49:51.752295

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '1720388991'
down_revision: Union[str, None] = ('1720387068', '1720387891', '1720388849')
branch_labels: Union[str, Sequence[str], None] = ()
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    pass


def downgrade() -> None:
    pass
