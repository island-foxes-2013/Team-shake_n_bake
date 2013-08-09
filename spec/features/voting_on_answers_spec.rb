require 'spec_helper'

describe 'voting on an answer' do
  
  context 'on a question page with answers' do
    subject { page }

    before(:each) do
      @question = create(:question)
      @question.answers << build(:answer, user: @question.user, question: @question)
      login_as(@question.user)
      visit question_path(@question)
    end

    it { should have_css('form#new_vote') }

    it 'should see the answer content' do
      should have_content(@question.answers.first.body)
    end

    it 'can upvote on an answer' do
      expect {
        click_on 'Vote'
      }.to change(Vote, :count).by(1)
    end

  end
end
