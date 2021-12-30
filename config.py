import os

class Config(object):
  SECRET_KEY = os.environ.get('SECRET_KEY') or os.urandom(32)
  SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or 'postgresql://superiorkid:root@localhost/todo'
  SQLALCHEMY_TRACK_MODIFICATIONS = False