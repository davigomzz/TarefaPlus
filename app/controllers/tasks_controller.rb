class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :check_student, only: [:create]

  def index
    if current_user.professor?
      @tasks = Task.all.order(:due_date)
    else
      taken_task_ids = current_user.task_students.pluck(:task_id)
      @tasks = Task.where.not(id: taken_task_ids).order(:due_date)
    end
  end
  
  

  def new
    @task = Task.new
  end

  
  #a criação é permitida somente para o professor
  def create
    @task = current_user.tasks.build(task_params)
    @task.status = 0 
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
