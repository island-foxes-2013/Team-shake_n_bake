require 'spec_helper'

describe Comment do
  let(:comment) { Comment.new(content: "I am a test comment") }

  it { should belong_to :answer }
  it { should belong_to :question }
  it { should belong_to :user }

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
