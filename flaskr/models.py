import datetime
from typing import List
from typing import Optional
from sqlalchemy import String, UniqueConstraint, ForeignKey
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column
from sqlalchemy import TIMESTAMP, func
from sqlalchemy.orm import relationship
from .db import db

class User(db.Model):
    __tablename__ = "user"

    id: Mapped[int] = mapped_column(primary_key=True)
    username: Mapped[str] = mapped_column(String(50), unique=True)
    password: Mapped[str] = mapped_column(String(256))

    experiences: Mapped[List["Experience"]] = relationship(back_populates="user")
    projects: Mapped[List["Project"]] = relationship(back_populates="user")
    profile: Mapped["Profile"] = relationship(back_populates="user")

class Profile(db.model):
    __tablename__="profile"

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(ForeignKey('user.id'))
    bio: Mapped[str] = mapped_column(String(256))
    profile_picture: Mapped[str] = mapped_column(String(256))
    email: Mapped[str] = mapped_column(String(100))
    contact_email: Mapped[str] = mapped_column(String(100))

    user: Mapped["User"] = relationship(back_populates="profile")

#--------------------------------------------------------------------------------

class Experience(db.Model):
    __tablename__ = "experience"

    id: Mapped[int] = mapped_column(primary_key=True)
    author_id: Mapped[int] = mapped_column(ForeignKey("user.id"))
    job_title: Mapped[str] = mapped_column(String(50))
    company: Mapped[str] = mapped_column(String(100))
    start_date: Mapped[datetime.datetime] = mapped_column(TIMESTAMP)
    end_date: Mapped[datetime.datetime] = mapped_column(TIMESTAMP)
    description: Mapped[str] = mapped_column(String(1000))
    created: Mapped[datetime.datetime] = mapped_column(TIMESTAMP, server_default=func.current_timestamp())

    user: Mapped["User"] = relationship(back_populates="experiences")
    experience_highlights: Mapped[List["ExperienceHighlight"]] = relationship(back_populates="experience")
    experience_images: Mapped[List["ExperienceImage"]] = relationship(back_populates="experience")
    skills: Mapped[List["Skill"]] = relationship(back_populates="experience")

class ExperienceHighlight(db.model):
    __tablename__ = "experience_highlight"

    id: Mapped[int] = mapped_column(primary_key=True)
    experience_id: Mapped[int] = mapped_column(ForeignKey('experience.id'))
    content: Mapped[str] = mapped_column(String(700))

    experience: Mapped["Experience"] = relationship(back_populates="experience_highlights")

class ExperienceImage(db.model):
    __tablename__ = "experience_image"

    id: Mapped[int] = mapped_column(primary_key=True)
    experience_id: Mapped[int] = mapped_column(ForeignKey('experience.id'))
    url: Mapped[str] = mapped_column(String(200))

    experience: Mapped["Experience"] = relationship(back_populates="experience_images")

class Skill(db.model):
    __tablename__ = "skill"

    id: Mapped[int] = mapped_column(primary_key=True)
    experience_id: Mapped[int] = mapped_column(ForeignKey('experience.id'))
    name: Mapped[str] = mapped_column(String(700))

    experience: Mapped["Experience"] = relationship(back_populates="skills")

#----------------------------------------------------------------------------------

class Project(db.model):
    __tablename__ = "project"

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(ForeignKey('user.id'))
    project_title: Mapped[str] = mapped_column(String(100))
    company: Mapped[str] = mapped_column(String(100))
    description: Mapped[str] = mapped_column(String(1000))
    start_date: Mapped[datetime.datetime] = mapped_column(TIMESTAMP)
    end_date: Mapped[datetime.datetime] = mapped_column(TIMESTAMP)
    created: Mapped[datetime.datetime] = mapped_column(TIMESTAMP, server_default=func.current_timestamp())

    user: Mapped["User"] = relationship(back_populates="projects")
    project_highlights: Mapped[List["ProjectHighlight"]] = relationship(back_populates="project")
    project_images: Mapped[List["ProjectImage"]] = relationship(back_populates="project")

class ProjectHighlight(db.model):
    __tablename__ = "project_highlight"

    id: Mapped[int] = mapped_column(primary_key=True)
    project_id: Mapped[int] = mapped_column(ForeignKey('project.id'))
    content: Mapped[str] = mapped_column(String(700))

    project: Mapped["Project"] = relationship(back_populates="project_highlights")

class ProjectImage(db.model):
    __tablename__ = "project_image"

    id: Mapped[int] = mapped_column(primary_key=True)
    project_id: Mapped[int] = mapped_column(ForeignKey('project.id'))
    url: Mapped[str] = mapped_column(String(200))

    project: Mapped["Project"] = relationship(back_populates="project_images")

#--------------------------------------------------------------------------------------------

class Subscriber(db.model):
    __tablename__ = "subscriber"

    id: Mapped[int] = mapped_column(primary_key=True)
    email: Mapped[str] = mapped_column(String(100))
    name: Mapped[str] = mapped_column(String(50))
