require 'spec_helper'

describe Question do
	let(:question) {Question.new(title:"demo title", body:"this is a demo body")}

	# context "when title is empty" do
	# 	it "should not save" do
	# 		Question.create(body:"text").should be_nil
	# 	end
	# end
end





# # FOR REFERENCE
# describe User do
#   let (:user) { User.new }

#   context "when name is empty" do
#     it "should not be valid" do
#       expect(user.valid?).to be_false
#     end

#     it "should not save" do
#       expect(user.save).to be_false
#     end
#   end

#   context "when name is not empty" do
#     let (:user) { User.new(:name => "Alex") }

#     it "should be valid" do
#       expect(user.valid?).to be_true
#     end

#     it "should save" do
#       expect(user.save).to be_true
#     end
#   end
# end