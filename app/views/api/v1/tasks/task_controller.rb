class Api::V1::TasksController < ApplicationController
  before_action :authenticate_user! # Optional: Ensure user is logged in

  # GET /api/v1/tasks
  def index
    tasks = current_user.tasks
    render json: tasks
  end

  # GET /api/v1/tasks/:id
  def show
    task = current_user.tasks.find(params[:id])
    render json: task
  end

  # POST /api/v1/tasks
  def create
    task = current_user.tasks.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tasks/:id
  def update
    task = current_user.tasks.find(params[:id])
    if task.update(task_params)
      render json: task
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tasks/:id
  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    head :no_content
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed, :status, :priority, :due_date)
  end
end