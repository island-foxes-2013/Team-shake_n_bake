module AuthenticationHelper
	def login_as(user)
		visit sessions_path
		fill_in "Username", with: user.username
		fill_in "Password", with: "robot"
		click_button "Sign In"	
	end

	def log_out(user)
		visit questions_path
		click_button "Logout"
	end

end