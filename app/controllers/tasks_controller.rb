class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to project_path(@project)
  end

  def index
    @project = Project.find(params[:project_id])
    @task = @project.tasks.all
  end


  private
  def task_params
    params.require(:task).permit(:title, :description, :priority, :difficulty, :status)
  end
end
