require 'spec_helper'

describe UsersController do

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = Factory(:user)
      get :show, id: contact
      assigns(:user).should eq(user)
    end
    it "renders the :new template" do
      get :show, id: Factory(:user)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Contact to @contact"
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contact in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
    end
  end 

end