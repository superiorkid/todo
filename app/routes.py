from app import app, db
from flask import render_template, redirect, url_for
from app.forms import TodoForm
from app.models import Todo

@app.post('/')
@app.get('/')
def index():
  form = TodoForm()

  if form.validate_on_submit():

    new_task = Todo(tasks=form.tasks.data)
    db.session.add(new_task)
    db.session.commit()
      
    return redirect(url_for('index'))

  tasks = Todo.query.all()
  return render_template('index.html', form=form, tasks=tasks)

@app.get('/update/<int:id>')
def update(id):
  task = Todo.query.filter_by(id=id).first()
  task.complete = not task.complete
  db.session.commit()
  return redirect(url_for('index'))

@app.get('/delete/<int:id>')
def delete(id):
  task_to_delete = Todo.query.filter_by(id=id).first()
  db.session.delete(task_to_delete)
  db.session.commit()
  return redirect(url_for('index'))

@app.post('/delete_all')
def delete_all():
  db.session.query(Todo).filter(Todo.complete == True).delete()
  db.session.commit()

  return redirect(url_for('index'))