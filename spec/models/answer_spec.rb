
require 'spec_helper'

describe Answer do
let(:answer) { Answer.new(body: "White wine is the best.", question_id: 1, user_id: 1) }

  context "create answer" do

	  it "can be instantiated" do
	    expect(answer).to be_an_instance_of(Answer)
	  end

	  it "can be saved successfully" do
	    expect { answer.save }.to change(Answer, :count).by(1)
	  end

	  it "has a user id" do
	  	answer.user_id.should == 1
	  end

	  it "has a question id" do
	  	answer.question_id.should == 1
	  end

	  it "has a body" do
	  	answer.body.should == "White wine is the best."
	  end
  end

  context "validate answer" do

	  it "should raise error when answer body is blank" do
	  	answer.body = nil
	  	expect { user.save! }.to raise_error
	  end
	end
end