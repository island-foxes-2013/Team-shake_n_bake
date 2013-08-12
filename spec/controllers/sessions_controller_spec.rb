require 'spec_helper'

describe SessionsController do

  describe "DELETE #destroy" do
    let(:user) { create(:user) }
    before do
      login_as(user)
    end

    it "destroys a users session cookie" do
      delete :destroy
      expect(session[:id]).to be_blank
    end
    it "renders the homepage"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new session cookie"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not create a session cookie"
      it "re-renders the :new template"
    end
  end 

end