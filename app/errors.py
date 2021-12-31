from flask import render_template
from app import app, db
from sqlalchemy import exc


@app.errorhandler(exc.IntegrityError)
def internal_error(error):
  db.session.rollback()
  return render_template('errors/integrity_error.html')