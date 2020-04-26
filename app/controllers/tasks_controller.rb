# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_project

  def create
    @task = @project.tasks.create!(task_params)
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Project task was deleted"
    else
      flash[:error] = 'Project task could not be deleted'
    end
    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.fetch(:task, {}).permit(:name, :status, :project_id)
  end
end
