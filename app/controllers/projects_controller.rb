class ProjectsController < ApplicationController

  def new
    @project = Project.new
    authorize! :manage, @project
  end

  def show
    @project = Project.find(params[:id])
    authorize! :manage, @project
  end

  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    authorize! :manage, @project

    if @project.save
      redirect_to @project
    else
      render 'new'
    end

  end

  def edit
    @project = Project.find(params[:id])
    authorize! :manage, @project
  end

  def update
    @project = Project.find(params[:id])
    authorize! :manage, @project

    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    authorize! :manage, @project
    @project.destroy

    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
