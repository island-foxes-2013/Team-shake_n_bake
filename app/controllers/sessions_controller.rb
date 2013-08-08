class SessionsController < ApplicationController

  def create
  	user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
  	if user
  		session[:id] = user.id
  		redirect_to questions_path
  	else
  		redirect_to sessions_path
  	end
  end
  
  def destroy
  	session.clear
  	redirect_to questions_path
  end
end
