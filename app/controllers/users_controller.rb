class UsersController < ApplicationController
  before_filter :require_login, only: :show

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create params[:user]
    render :new and return unless @user.valid?
    auto_login @user
    redirect_to lists_path
  end
end
