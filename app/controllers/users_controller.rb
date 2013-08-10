class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      session[:id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @user.update_attributes(params[:user])
    
    redirect_to user_path(current_user)
  end
end
