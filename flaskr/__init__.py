import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy import MetaData
from whitenoise import WhiteNoise
from . import models
from .db import db
from . import auth
from . import main
from flask_alembic import Alembic

alembic = Alembic()

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        SQLALCHEMY_DATABASE_URI='postgresql://lbrenap:edmundo3541@localhost/personaldb',
        SQLALCHEMY_TRACK_MODIFICATIONS=False,
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # Initialize SQLAlchemy
    db.init_app(app)

    # Initialize Alembic
    alembic.init_app(app)

    #@app.cli.command('init-db') to test database
    # Ensure the tables are created
    #with app.app_context():

    #def init_db_command():
    with app.app_context():
        db.create_all()
        print('Initialized the database.')

    app.register_blueprint(main.bp)

    app.add_url_rule('/', endpoint='index')

    app.register_blueprint(auth.bp)

    # add whitenoise
    app.wsgi_app = WhiteNoise(app.wsgi_app, root="flaskr/static/")

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    return app
