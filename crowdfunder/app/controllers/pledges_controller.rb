class PledgesController < ApplicationController
  before_action :ensure_current_user
  before_action :load_project

  def show
    @pledge = Pledge.find(params[:id])
  end

  def new
    @pledge = Pledge.new
  end

  # def create
  #   @pledge = @project.pledges.build(pledge_params)
  #   @pledge.user = current_user
  #
  #   if @pledge.save
  #     redirect_to project_path(@project), notice: 'Thank you for your pledge.'
  #   else
  #     redirect_to project_path(@project), notice:  "We are unable to accept your pledge. Our apologies."
  #   end
  # end
  def create
  @user = current_user
  @project = Project.find(params[:project_id])
  @pledge = @project.pledges.new(pledge_params)
  @pledge.user = @user
  if @pledge.save
    redirect_to project_path(@project), :notice => "#{@pledge.amount} was successfully submitted to #{@project.title}"
  else
    render :new
  end
end

  def edit
    @pledge = Pledge.find(params[:id])
  end

  def update
    @pledge = Pledge.find(params[:id])

    if @pledge.update_attributes(pledge_params)
      redirect_to project_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    redirect_to project_path(@project)
  end

  private
  def pledge_params
    params.require(:pledge).permit(:project_id, :amount)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
