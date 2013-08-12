require 'spec_helper'

feature 'User goes through the navbar' do

	before(:each) do
		visit root_path
	end

	let(:user) {create(:user)}

	scenario "clicks on site logo in navbar" do
		click_link 'Shake \'n\' Bake'
		page.should have_content "The Hungies Overload"
	end

	scenario "clicks 'My Profile'" do
		# save_and_open_page
		# login_as(user)
		# visit sessions_path
		# fill_in "un-primary", with: 'Tyrone Biggums'
		# fill_in "pw-primary", with: 'tb'

		# click_button "signin-primary"
		
		# visit root_path
		# save_and_open_page
		# page.should have_content "Hungies"
	

		# save_and_open_page
		# click_link 'My Profile'
		# page.should have_content "My Questions:"
	end
end