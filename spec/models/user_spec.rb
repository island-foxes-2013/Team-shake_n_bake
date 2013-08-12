require 'spec_helper'

describe User do

	it { should have_many(:questions)}
	it { should have_many(:answers)}
	it { should have_many(:comments)}
	it { should have_many(:votes)}

let(:user) { FactoryGirl.create(:user) }
let(:question) { FactoryGirl.create(:question) }
let(:answer) { FactoryGirl.create(:answer) }
let(:comment) { FactoryGirl.create(:comment) }
let(:vote) { FactoryGirl.create(:vote) }

  context "create user" do

	  it "can be instantiated" do
	    expect(user).to be_an_instance_of(User)
	  end

	  it "can be saved successfully" do
	    expect { user.save }.to change(User, :count).by(1)
	  end
  end

  context "validate user on error" do

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

	  it "should raise error when email is not unique" do
	  	user.email = 'bananas@me.com'
	  	user.save!
	    test_user = User.new(username: 'frank', email: 'bananas@me.com', password: '123456')
	  	expect { test_user.save! }.to raise_error
	  end
    
    it "should raise error when username is not unique" do
	  	user.username = 'bananas'
	  	user.save!
	    test_user = User.new(username: 'bananas', email: 'bananas@me.com', password: '123456')
	  	expect { test_user.save! }.to raise_error
	  end
	end

	  context "validate associations" do

		it "should have a question when assiciated with a question on create" do
     user.questions.create(title: 'yellowsnow', body: 'its a must see')
	  	user.questions.count.should eq 1
	  end
    
    it "should have a answer when assiciated with an answer on create" do
     user.answers.create(body: 'yellowsnow')
	  	user.answers.count.should eq 1
	  end

	  it "should have a comments when assiciated with an comment on create" do
     user.comments.create(content: 'yellowsnow')
	  	user.comments.count.should eq 1
	  end

	end
end
