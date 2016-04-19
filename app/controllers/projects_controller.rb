class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all.order('created_at DESC')
  end

  def new
    @api = Project.new
  end

  def create
    project = Project.new(project_params)
    project.user = current_user
    if project.save
      redirect_to projects_path, notice: "You have successfully created a project."
    else
      redirect_to new_project_path, alert: project.errors.full_messages.join(', ')
    end
  end



  private

  def project_params
    params.require(:project).permit(
    :title, :description, :category, :duration, :address, :zipcode)
  end
end
