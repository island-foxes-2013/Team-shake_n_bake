module AuthenticationHelper
	def login_as(user)
		visit sessions_path
		fill_in "Username", with: user.username
		fill_in "Password", with: "robot"
		click_button "Sign In"	
	end
end