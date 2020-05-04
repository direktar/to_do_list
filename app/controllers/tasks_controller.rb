# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      success
    else
      danger_with_errors(@task)
    end
    redirect_to root_path
  end

  def update
    if @task.update(task_params)
      success
    else
      danger_with_errors(@task)
    end
    redirect_back fallback_location: @project
  end

  def destroy
    if @task.destroy
      success
    else
      flash[:danger] = "Task was successfully destroyed."
    end
    redirect_to root_path
  end

  def uncomplete
    @task.update(status: 'false')
    redirect_to root_path, success: 'Task uncompleted'
  end

  def complete
    @task.update(status: 'true')
    redirect_to root_path, success: 'Task completed'
  end

  private

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.fetch(:task, {}).permit(:name, :status, :project_id, :deadline)
  end
end
