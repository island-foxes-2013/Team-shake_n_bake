require 'spec_helper'

describe "answering a question" do

	before do
		@question = create(:question)
		user = create(:user)
		login_as(user)
	end

	# context "on new answer page" do
		# 	it
		# 	end
		# end

		context "on question show page" do
			it "can go to the answer creation form by clicking on the Answer This Question! link" do
				visit question_path(@question)
				click_link("Answer This Question!")
				page.should have_content("Answer this question:")
			end
		end
	end