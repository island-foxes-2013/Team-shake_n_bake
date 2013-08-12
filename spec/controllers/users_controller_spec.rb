require 'spec_helper'

describe UsersController do

  let(:user) { create(:user) }

  describe "GET #show" do
    it "assigns the requested user to @user" do
      get :show, id: user.id
      assigns(:user).should eq(user)
    end
    it "renders the show template" do
      get :show, id: user.id
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new User to @user" do
      get :new
      assigns[:user].should be_new_record
      assigns[:user].should be_a(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User,:count).by(1)
      end
      it "redirects to the user profile page" do
        post :create, user: attributes_for(:user)
        response.should redirect_to user_url(User.last.id)
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect {
          post :create, user: attributes_for(:invalid_user)
          }.to_not change(User,:count)
      end
      it "re-renders the :new template" do
        post :create, user: attributes_for(:invalid_user)
        response.should redirect_to new_user_url
      end
    end
  end 
end