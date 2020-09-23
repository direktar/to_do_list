# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[update destroy]

  def index
    @projects = current_user.projects.order(updated_at: :desc) if user_signed_in?
  end

  def create
    @project = current_user.projects.build(project_params)
    action_status(@project.save, @project)
  end

  def update
    action_status(@project.update(project_params), @project)
  end

  def destroy
    action_status(@project.destroy, @project)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.fetch(:project, {}).permit(:name)
  end
end
