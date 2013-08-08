class UsersController < ApplicationController
  def index
  end

  def new
    if logged_in?
      @user = User.new
    else
      redirect_to sessions_path
    end
  end

  def create
    user = User.new(params[:user])
    user.save
    session[:id] = user.id
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end
end
