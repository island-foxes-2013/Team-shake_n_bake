require 'spec_helper'

feature 'User goes through the navbar' do
	let(:user) {create(:user)}

	before do
		login_as(user)
		visit root_path
	end

	scenario "clicks on site logo in navbar" do
		click_link 'Shake \'n\' Bake'
		page.should have_content "The Hungies Overload"
	end

	scenario "clicks 'My Profile'" do
		click_link 'My Profile'
		page.should have_content "My Questions"
	end
end