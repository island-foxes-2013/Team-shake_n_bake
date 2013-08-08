module UsersHelper

	def current_user
		User.find_by_id(session[:id])
	end

	def logged_in?
		!session[:id].nil?
	end
end
