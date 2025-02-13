class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[edit update destroy]
  before_action :check_student, only: [:create]

  def index
    @tasks = if current_user.professor?
               Task.order(:due_date)
             else
               Task.for_classroom(current_user.classroom_id)
                   .not_taken_by(current_user)
                   .order(:due_date)
             end
  end

  def new
    @task = Task.new
  end

  # a criação é permitida somente para o professor
  def create
    @task = current_user.tasks.build(task_params)
    @task.status = 0
    if @task.save
      redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
    else
      render :new
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
    return unless current_user.role == 'student'

    redirect_to root_path, alert: 'Apenas professores podem criar tarefas.'
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :classroom_id)
  end
end
