class TasksStudentController < ApplicationController
 
  def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
      else
        render :new
      end
  end

end