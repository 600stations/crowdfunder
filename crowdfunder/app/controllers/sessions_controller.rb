class SessionsController < ApplicationController
  def new
    @user = User.new
  end


  def create
    if @user = login(params[:email], params[:password])
      redirect_to(root_path, alert: ' - Login successful')
    else
      flash.now[:alert] = ' - Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, alert: ' - Logged out!')
  end

end
