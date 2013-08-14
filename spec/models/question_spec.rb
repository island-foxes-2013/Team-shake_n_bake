require 'spec_helper'

describe Question do
	it {should belong_to(:user)}
	it {should have_many(:answers)}
	it {should have_many(:comments)}
	it {should have_many(:votes)}

	let!(:question) {Question.create(title:"demo title", body:"this is a demo body")}
	let(:user) {create(:user)}
	let(:answer) {create(:answer)}
	let(:comment) {Comment.new(content: "I am a test comment")}

	context "create question" do
	  it "can be instantiated" do
	    expect(question).to be_an_instance_of(Question)
	  end
	  it "can be saved successfully" do
	    expect { question.save }.to change(Question, :count).by(1)
	  end
  end

	context "when title is empty" do
		it "should not save" do
			Question.create(body:"text").id.should be_nil
		end
	end

	context "when body is empty" do
		it "should not save" do
			Question.create(title:"text").id.should be_nil
		end
	end

	context "both fields are filled in" do
		it "should save" do
			expect {question.save}.to be_true
		end
	end

	context "when there are search parameters" do
		it "should narrow down the displayed questions" do
			Question.search('hello').should_not eq(Question.all)
		end
	end

	context "when there are no search parameters" do
		it "should show all the questions" do
			# Question.search('').should eq(Question.scoped.all)
			Question.search('').to_a.should eq(Question.scoped.to_a)
		end
  end
end