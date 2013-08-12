module ControllerAuthenticationHelper
  def login_as(user)
    session[:id] = user.id
  end

  def log_out(user)
    session.clear
  end
end