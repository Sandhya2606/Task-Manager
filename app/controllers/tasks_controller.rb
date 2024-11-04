class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    # Start with all tasks for the current user
    @tasks = current_user.tasks

    # Apply search if the parameter is present
    if params[:search].present?
      @tasks = @tasks.where("LOWER(title) LIKE ?", "%#{params[:search].downcase}%")
    end

    # Apply filter based on the completion status
    if params[:filter] == "completed"
      @tasks = @tasks.where(completed: true)
    elsif params[:filter] == "not_completed"
      @tasks = @tasks.where(completed: false)
    end
  end


  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to @task
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task was successfully updated."
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task was successfully deleted."
    redirect_to tasks_path
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed, :status, :priority, :due_date)
  end
end
