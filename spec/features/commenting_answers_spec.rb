require 'spec_helper'

describe 'Commenting on Answers' do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:question) { user.questions.create(title: "title", body: "content") }
  let!(:answer) { question.answers.create(body: "this question sucks") }
  let!(:comment) { answer.comments.create(content: "this answer sucks")}

  before do
    login_as(user)
    user.answers << answer
    user.comments << comment
    user.save
  end

  context "on question page", js: true do
    it "user can add a comment" do
      visit question_path(question)
      fill_in "comment", with: "I love this question"
      click_button "Add Comment"
      page.should have_content("I love this question")
    end
  end
end


