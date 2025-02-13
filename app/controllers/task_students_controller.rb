class TaskStudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_student, only: [:edit, :update]

  def index
    @tasks_students = current_user.task_students.includes(:task)
  end

  def create
    task = Task.find(params[:task_id])
    @task_student = current_user.task_students.build(task: task, status: 0)
    if @task_student.save
      redirect_to task_students_path, notice: 'Tarefa adicionada com sucesso!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task_student.update(task_student_params)
      redirect_to task_students_path, notice: "Tarefa atualizada com sucesso!"
    else
      render :edit
    end
  end

  private

  def set_task_student
    @task_student = current_user.task_students.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Tarefa não encontrada ou sem permissão para acessá-la."
    redirect_to task_students_path
  end

  def task_student_params
    params.require(:task_student).permit(:status)
  end
end
