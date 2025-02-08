class TasksController < ApplicationController
  
  before_action :set_task, only: [:edit, :update, :destroy]

  
    def index
      @tasks = current_user.tasks.order(:due_date)
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso!'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_path, notice: 'Tarefa removida com sucesso!'
    end
  
    private
  
    def set_task
      @task = current_user.tasks.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status)
    end
  end
