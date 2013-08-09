require 'spec_helper'

describe "answering a question" do

	before do
		@question = create(:question)
		@user = create(:user)
		login_as(@user)
	end

	context "on new answer page" do
			it "can create a new answer to a question" do
				visit new_question_answer_path(@question)

				expect {
					fill_in 'answer_body', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
					click_button "Submit Answer!"
					}.to change(Answer, :count).by(1)

					page.should have_content("Answers to this question:")
			end
		end

		context "on question show page" do
			it "can go to the answer creation form by clicking on the Answer This Question! link" do
				visit question_path(@question)
				click_link("Answer This Question!")
				page.should have_content("Answer this question:")
			end
		end

		context "on question show page" do
			it "should not have the Answer This Question! link on page when not signed in" do
				visit questions_path(@question)
				page.should_not have_content("Answer this question!")
			end 
		end
	end