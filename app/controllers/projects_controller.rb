# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[update destroy]

  def index
    @projects = Project.order("updated_at DESC")
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      success
    else
      danger_with_errors(@project)
    end
    redirect_to root_path
  end

  def update
    if @project.update(project_params)
      success
    else
      danger_with_errors
    end
    redirect_to root_path
  end

  def destroy
    if @project.destroy
      success
    else
      flash[:danger] = "Project was successfully destroyed."
    end
    redirect_to root_url
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.fetch(:project, {}).permit(:name)
  end
end
