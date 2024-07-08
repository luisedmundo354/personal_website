import functools
from sqlalchemy import exc
from sqlalchemy import update

from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from .models import User, Post
from .db import db

bp = Blueprint('blog', __name__)

@bp.route('/admin')
def index():
    profile = db.session.execute(db.select(User, Profile).join(User.profile).where(User.id == 1)).scalars().all()
    experience = db.session.execute(db.select(Experience, ExperienceHighlight, ExperienceImage, Skill).join(Experience.experience_highlights).join(Experience.experience_images).join(Experience.skills)).scalars().all()
    project = db.session.execute(db.select(Project, ProjectHighlight, ProjectImage).join(Project.experience_highlights).join(Project.experience_images).join(Project.skills)).scalars().all()
    return render_template('form/home.html', posts=posts)

@bp.route('/create', methods=('GET', 'POST'))
@login_required
def create():
    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        error = None

        if not title:
            error = 'Title is required.'

        if error is not None:
            flash(error)
        else:
            post = Post(title=title, body=body, author_id=g.user.id)
            db.session.add(post)
            db.session.commit()
            return redirect(url_for('blog.index'))

    return render_template('form/create.html')

def get_post(id, check_author=True):
    post = db.session.execute(db.select(Post).join(User.posts).where(Post.id==id)).scalar_one()

    if post is None:
        abort(404, f"Post id {id} doesn't exist.")

    if check_author and post.author_id != g.user.id:
        abort(403)

    return post

@bp.route('/<int:id>/update', methods=('GET', 'POST'))
@login_required
def update(id):
    post = get_post(id)

    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        error = None

        if not title:
            error = 'Title is required.'

        if error is not None:
            flash(error)
        else:
            db.session.execute(db.update(Post).where(post.id==id).values(title=title, body=body))
            db.session.commit()
            return redirect(url_for('blog.index'))

    return render_template('form/update.html', post=post)

@bp.route('/<int:id>/delete', methods=('POST',))
@login_required
def delete(id):
    get_post(id)
    post = session.get(Post, id)
    db.session.delete(post)
    db.session.commit()
    return redirect(url_for('form.index'))