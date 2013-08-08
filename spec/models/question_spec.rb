require 'spec_helper'

describe Question do
	let(:question) {Question.new(title:"demo title", body:"this is a demo body")}

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
end