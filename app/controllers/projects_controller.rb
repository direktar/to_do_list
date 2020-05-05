# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[update destroy]

  def index
    @projects = current_user.projects.order("updated_at DESC") if user_signed_in?
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
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
