require 'spec_helper'

describe Vote do


  # it { should respond_to :user_id }
  # it { should respond_to :answer_id }
  it { should belong_to(:user)}
  it { should belong_to(:votetable)}

let(:user) { FactoryGirl.create(:user) }
let(:question) { FactoryGirl.create(:question) }
let(:answer) { FactoryGirl.create(:answer) }
let(:comment) { FactoryGirl.create(:comment) }
let(:question_vote) { FactoryGirl.create(:question_vote) }
let(:answer_vote) { FactoryGirl.create(:answer_vote) }

    context "voting up or down" do
      
      it "should not be able to vote up if previous up vote" do
        test_vote = question.votes.create(user_id: user.id)
        test_vote.save!
      end
      
      it "should fail if a user votes on an answer they have previously voted on" do
        Vote.create_vote(answer, user, 'up')
        second_vote = Vote.create_vote(answer, user, 'up')
        expect(second_vote).to eq("You already voted up")
      end
     
    end

    context "valid vote" do 

      it "can be saved successfully" do
        vote = Vote.new(user_id: 1, votetable_id: 2, votetable_type: 'Answer')
        expect(vote.save!).to eq true
      end

      # vote = Vote.create_vote('Answer', user, 'dwn')
      # Vote.check_vote
      it "should create up vote" do
        vote = Vote.new(user_id: 1, votetable_id: 2, votetable_type: 'Answer', vote: 'up')
        vote.save
        expect(vote.vote).to eq 'up'
      end

      it "should create dwn vote" do
        vote = Vote.new(user_id: 1, votetable_id: 2, votetable_type: 'Answer', vote: 'up')
        vote.save
        expect(vote.vote).to eq 'up'
      end

    end 
    


end