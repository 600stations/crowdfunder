class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @reward = Reward.new
  end

  def show
    require_login
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @project}
      end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, alert: " - Project created"
    else
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:title,
                                    :description,
                                    :deadline,
                                    :goal,
                                    rewards_attributes: [:amount])
  end
end
