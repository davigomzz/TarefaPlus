class TaskStudentsController < ApplicationController 
  def index
    @tasks_students = current_user.task_students
  end

  def create
    task = Task.find(params[:task_id])
    @task_students = current_user.task_students.build(task: task, status:0) 
      if @task_students.save
        redirect_to task_students_path, notice: 'Tarefa criada com sucesso!'
      else
        render :new
      end
  end

end