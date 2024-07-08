import functools
from datetime import datetime
from sqlalchemy import exc
from sqlalchemy import update

from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for, render_template
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from .models import User, Profile, Experience, Project, Skill, ExperienceHighlight, ExperienceImage, ProjectImage, ProjectHighlight
from .db import db

bp = Blueprint('main', __name__)


@bp.app_template_filter()
def date_format(value, format="%B, %Y"):
    return value.strftime(format)


@bp.route('/')
def index():
    user = db.session.execute(db.select(User, Profile).join(User.profile).where(User.id == 1)).scalars().first()
    experience = db.session.execute(db.select(Experience, ExperienceHighlight, ExperienceImage, Skill).join(Experience.experience_highlights).join(Experience.experience_images).join(Experience.skills)).scalars().all()
    project = db.session.execute(db.select(Project, ProjectHighlight, ProjectImage).join(Project.project_highlights).join(Project.project_images)).scalars().all()
    return render_template('main/index.html', user=user, experience=experience, project=project)