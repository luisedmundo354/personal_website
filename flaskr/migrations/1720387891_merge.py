"""merge 

Revision ID: 1720387891
Revises: 
Create Date: 2024-07-07 21:31:31.257872

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '1720387891'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = ()
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    pass


def downgrade() -> None:
    pass
