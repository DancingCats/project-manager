class ProjectsController < ApplicationController

  load_and_authorize_resource
  skip_authorize_resource :only => :index

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    if can? :read, Project
      @projects = Project.all
    else
      render layout: 'start'
    end

  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render 'new'
    end

  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
