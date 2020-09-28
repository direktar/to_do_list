# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[complete uncomplete update destroy]
  # anofnaosfn
  before_action :set_project, only: :create

  def complete
    @task.update(status: 'true')
    redirect_to root_path, success: 'Task completed'
  end

  def uncomplete
    @task.update(status: 'false')
    redirect_to root_path, success: 'Task uncompleted'
  end

  def update_position
    params[:task].each_with_index do |id, index|
      @project.tasks.where(id: id).update(position: index + 1)
    end
    render body: nil
  end

  def create
    @task = @project.tasks.build(task_params)
    @task.user = current_user
    action_status(@task.save, @task)
  end

  def update
    action_status(@task.update(task_params), @task)
  end

  def destroy
    action_status(@task.destroy, @task)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.fetch(:task, {}).permit(:name, :status, :project_id, :deadline, :position)
  end
end
