module SessionsHelper
	
  def current_user
    if logged_in?
      User.find(session[:id])
    end
  end

  def logged_in?
    session[:id] != nil
  end

end
