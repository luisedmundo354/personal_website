import functools
from sqlalchemy import exc
from sqlalchemy import update

from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from .models import User
from .db import db

bp = Blueprint('blog', __name__)