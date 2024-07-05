import functools
from sqlalchemy import exc

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash
from .models import User
from .db import db

bp = Blueprint('auth', __name__, url_prefix='/auth')