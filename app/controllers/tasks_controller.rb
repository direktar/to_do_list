# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]

  def create
    @task = @project.tasks.create!(task_params)
    redirect_to @project
  end

  def edit
    render('tasks/form')
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_back fallback_location: @project, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { redirect_back fallback_location: @project, danger: 'Task is not updated.' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = 'Project task was deleted'
    else
      flash[:error] = 'Project task could not be deleted'
    end
    redirect_to @project
  end

  def uncomplete
    @task.update(status: 'uncomplete')
    redirect_to @project, notice: 'Task uncompleted'
  end

  def complete
    @task.update(status: 'complete')
    redirect_to @project, notice: 'Task completed'
  end

  def prioritize
    @task.update(status: 'prioritize')
    redirect_to @project, notice: 'Task prioritized'
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
