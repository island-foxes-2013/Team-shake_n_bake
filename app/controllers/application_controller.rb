class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def current_user
    if logged_in?
      User.find(session[:id])
    end
  end

  def logged_in?
    session[:id] != nil
  end
end
