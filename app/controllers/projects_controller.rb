# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

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

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if @project.destroy
      success
    else
      flash[:danger] = "Project was successfully destroyed."
    end
    redirect_to root_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.fetch(:project, {}).permit(:name)
  end
end
