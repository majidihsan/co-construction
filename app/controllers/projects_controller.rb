class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all.order('created_at DESC')
  end

  def new
    @project = Project.new
  end

  def edit
  @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path, notice: "You have successfully updated your project."
    else
      redirect_to edit_project_path(@project), alert: @project.errors.full_messages.join(', ')
    end
  end

  def create
    project = Project.new(project_params)
    @user = current_user
    project.user = @user
    if project.save
      redirect_to projects_path, notice: "You have successfully created a project."
    else
      redirect_to new_project_path, alert: project.errors.full_messages.join(', ')
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
       redirect_to projects_path, :notice => "Project deleted."
    end
  end

  def interested
    @user = current_user
    @company = @user.company
    @project = Project.find(params[:project_id])
    @interested = InterestedCompany.create(company: @company, project: @project)
    redirect_to projects_path, notice: "You have successfully added a project."
  end

  private

  def project_params
    params.require(:project).permit(
    :title, :description, :category, :duration, :address, :zipcode)
  end
end
