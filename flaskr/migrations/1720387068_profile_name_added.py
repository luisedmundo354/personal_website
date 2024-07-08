"""profile name added

Revision ID: 1720387068
Revises: 1720230127
Create Date: 2024-07-07 21:17:48.201485

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '1720387068'
down_revision: Union[str, None] = '1720230127'
branch_labels: Union[str, Sequence[str], None] = ()
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('profile', sa.Column('name', sa.String(length=50), nullable=False))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('profile', 'name')
    # ### end Alembic commands ###
