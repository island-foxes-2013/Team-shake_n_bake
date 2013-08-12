require 'spec_helper'

describe "answering a question" do

	before do
		@question = create(:question)
	end

	context "on new answer page", js: true do
		before do
			@user = create(:user)
			login_as(@user)
		end
	
		it "can create a new answer to a question" do
			visit question__path(@question)
			click_on "Be the first to answer this question!"
			fill_in "answer_body", with: "The first answer"
			click_on "Create Answer"
			within(".answer_box") do
				page.should have_content("The first answer")
			end
		end
	end


	context "on question show page" do
		it "should not let the logged out user answer this question" do
			visit questions_path(@question)
			page.should_not have_content("Be the first to answer this question!")
		end 
	end
end