from flask_wtf import FlaskForm
from wtforms import StringField, BooleanField, SubmitField
from wtforms.validators import DataRaquired


class TodoForm(FlaskForm):
  task = StringField('Enter Task', validators=[DataRaquired()])
  is_complete = BooleanField('Is Complete')
  submit = SubmitField('Submit')