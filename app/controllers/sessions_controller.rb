class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login params[:user][:email], params[:user][:password]
    unless @user
      @user = User.new
      flash[:error] = 'Invalid email or password'
      render :new and return
    end
    redirect_to lists_path, notice: "Welcome #{@user.name}"
  end

  def destroy
    logout
    redirect_to signin_path
  end
end
