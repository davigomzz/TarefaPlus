class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :check_student, only: [:create]

  def index
    @tasks = current_user.tasks.order(:due_date)
    @tasks_grouped = @tasks.group_by(&:status)
  end
  

  def new
    @task = Task.new
  end

  
  #a criação é permitida somente para o professor
  def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
      else
        render :new
      end
  end

  def edit
    if current_user.role == 'student'
      unless @task.classroom_id == current_user.classroom_id
        redirect_to tasks_path, alert: 'Você não pode editar esta tarefa.'
      end
    elsif current_user.role == 'teacher'
      unless @task.teacher_id == current_user.id
        redirect_to tasks_path, alert: 'Você não tem permissão para editar esta tarefa.'
      end
    else
      redirect_to tasks_path, alert: 'Acesso negado.'
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if current_user.role == 'teacher' && @task.teacher_id == current_user.id
      @task.destroy
      redirect_to tasks_path, notice: 'Tarefa removida com sucesso!'
    else
      redirect_to tasks_path, alert: 'Você não tem permissão para excluir esta tarefa.'
    end
  end

  private

  def check_student
    if current_user.role == 'student'
      redirect_to root_path, alert: 'Apenas professores podem criar tarefas.'
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :classroom_id)
  end
end
