require 'spec_helper'

describe UsersController do

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = Factory(:user)
      get :show, id: contact
      assigns(:user).should eq(user)
    end
    it "renders the show template" do
      get :show, id: Factory(:user)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new User to @user" do
      visit new_user_path
      @user.should eq(User.new)
    end
    it "renders the new template" do
      get :show, id: Factory(:user)
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect {
          post :create, user: Factory.attributes_for(:user)
        }.to change(User,:count).by(1)
      end
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect {
          post :create, user: Factory.attributes_for(:invalid_user)
          }.to_not change(User,:count)
      end
      it "re-renders the :new template" do
        post :create, user: Factory.attributes_for(:invalid_user)
        response.should render_template :new
      end
    end
  end 

end