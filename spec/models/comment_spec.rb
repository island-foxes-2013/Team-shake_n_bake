require 'spec_helper'

describe Comment do
  let(:user) {create(:user)}
  let(:question) {create(:question)}
  let(:answer) {create(:answer)}
  let(:comment) { Comment.new(content: "I am a test comment") }

  context "proper associations" do
    it "should belong to a user" do
      user.comments << comment    
      comment.should belong_to :user
    end
    it "can belong to a question" do
      question.comments << comment
      comment.commentable_type.should eq "Question"
    end
    it "can belong to an answer" do
      answer.comments << comment
      comment.commentable_type.should eq "Answer"
    end
  end

  context "create comment" do
    it "can be instantiated" do
      expect(comment).to be_an_instance_of(Comment)
    end
    it "can be saved successfully" do
      expect(comment.save).to eq true
    end
    it "needs a content" do
      subject{ Comment.new }
      expect(subject.save).to eq false
    end
  end
end
