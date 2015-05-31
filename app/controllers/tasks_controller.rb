class TasksController < ApplicationController
  load_and_authorize_resource

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to project_path(@project)
  end

  def index
    @project = Project.find(params[:project_id])
    @task = @project.tasks.all
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to project_tasks_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy

    redirect_to project_tasks_path(@project)
  end


  private
  def task_params
    params.require(:task).permit(:title, :description, :priority, :difficulty, :status)
  end
end
