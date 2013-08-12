require 'spec_helper'

describe User do
let(:user) { FactoryGirl.create(:user) }

  context "create user" do

	  it "can be instantiated" do
	    expect(user).to be_an_instance_of(User)
	  end

	  it "can be saved successfully" do
	    expect { user.save }.to change(User, :count).by(1)
	  end
  end

  context "validate user" do

	  it "should raise error when password is blank" do
	  	user.password = nil
	  	expect { user.save! }.to raise_error
	  end

	  it "should raise error when username is blank" do
	  	user.username = nil
	  	expect { user.save! }.to raise_error
	  end

	  it "should raise error when email is blank" do
	  	user.email = nil
	  	expect { user.save! }.to raise_error
	  end

	  it "should raise error when email "
	end
end

validates :username, :email, presence: true

  validates :username, :email, uniqueness: true