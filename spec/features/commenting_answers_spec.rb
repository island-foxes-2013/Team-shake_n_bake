require 'spec_helper'

def login(user)
  visit sessions_path
  fill_in 'username', with: user.username
  fill_in 'password', with: user.password
  click_on 'Sign In'
end



describe 'Commenting on Answers' do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:question) { user.questions.create(title: "title", body: "content") }
  let!(:answer) { question.answers.create(body: "this question sucks") }
  let!(:comment) { answer.comments.create(content: "this answer sucks")}

  before do
    login(user)
    user.answers << answer
    user.comments << comment
    user.save
  end

  context "on question page" do
    it "should have a comment link" do
      visit question_path(question)
      expect(page).to have_link('Comment', href: answer_path(answer))
    end
  end

  context "comment page" do
    before :each do
      visit answer_path(answer)
    end

    it "should load the page" do
      expect(page).to have_content "Answer:"
    end

    it "should load the answer" do
      expect(page).to have_content answer.body
    end

    it "should load comments for the answer" do
      expect(page).to have_content comment.content
    end

    it "should create a new comment" do
      expect {
        fill_in 'comment[content]', with: "This is test content to a question I don't understand"
        click_button ("Create Comment")
      }.to change(Comment, :count).by(1)
    end
  end
end


