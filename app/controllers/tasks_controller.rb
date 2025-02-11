class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    if current_user.role == 'student'
      if current_user.classroom_id.present?
        @tasks = Task.where(classroom_id: current_user.classroom_id).order(:due_date)
      else
        @tasks = Task.none
        flash.now[:alert] = "Você não está associado a nenhuma série. Por favor, contate o administrador."
      end
    else
      @tasks = Task.where(teacher_id: current_user.id).order(:due_date)
    end
    @tasks_grouped = @tasks.group_by(&:status)
  end
  

  def new
    if current_user.role == 'teacher'
      @task = Task.new
    else
      redirect_to tasks_path, alert: 'Você não tem permissão para criar tarefas.'
    end
  end

  def create
    if current_user.role == 'teacher'
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
      else
        render :new
      end
    else
      redirect_to tasks_path, alert: 'Você não tem permissão para criar tarefas.'
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
    if current_user.role == 'student'
      if @task.classroom_id == current_user.classroom_id
        if @task.update(task_params_student)
          redirect_to tasks_path, notice: 'Status da tarefa atualizado com sucesso!'
        else
          render :edit
        end
      else
        redirect_to tasks_path, alert: 'Você não pode editar esta tarefa.'
      end
    elsif current_user.role == 'teacher'
      if @task.teacher_id == current_user.id
        if @task.update(task_params_teacher)
          redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso!'
        else
          render :edit
        end
      else
        redirect_to tasks_path, alert: 'Você não tem permissão para editar esta tarefa.'
      end
    else
      redirect_to tasks_path, alert: 'Acesso negado.'
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

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params_teacher
    params.require(:task).permit(:title, :description, :due_date, :status, :classroom_id)
  end

  def task_params_student
    params.require(:task).permit(:status)
  end
end
