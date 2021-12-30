from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, BooleanField
from wtforms.validators import DataRequired


class TodoForm(FlaskForm):
  tasks = StringField('Enter Task', validators=[DataRequired()])
  is_complete = BooleanField('Is Complete?')
  submit = SubmitField('Add')