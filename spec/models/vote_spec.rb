require 'spec_helper'

describe Vote do

  let(:vote_invalid) { Vote.new }

  it { should respond_to :user_id }
  it { should respond_to :answer_id }

  describe "create vote" do

    context "invalid vote creation" do
      let(:vote) { FactoryGirl.create(:vote) }
      let(:vote_dup) { Vote.new(user_id: vote.user_id, answer_id: vote.answer_id)}

      it "should fail without valid references" do
        expect(vote_invalid.save).to eq false
      end
  
      it "should fail if a user votes on an answer they have previously voted on" do
        vote.save
        expect(vote_dup.save).to eq false
      end
     
    end


    context "valid vote" do 
      let(:vote) { FactoryGirl.create(:vote) }

      it "can be saved successfully" do
        expect(vote.save).to eq true
      end
    end 
    
  end

end