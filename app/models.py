from app import db
from datetime import datetime

class Todo(db.Model):
  id = db.Column(db.Integer, primary_key=True)
  tasks = db.Column(db.String(120), index=True, unique=True)
  complete = db.Column(db.Boolean, default=False)

  def __repr__(self):
    return f'<Task {self.tasks}, {self.complete}>'