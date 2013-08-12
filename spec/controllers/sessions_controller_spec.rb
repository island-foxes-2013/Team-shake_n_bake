require 'spec_helper'

describe SessionsController do

  let(:user) { create(:user) }

  describe "DELETE #destroy" do
    
    before do
      login_as(user)
    end

    it "destroys a users session cookie" do
      delete :destroy
      expect(session[:id]).to be_blank
    end
    it "redirects to the questions list" do
      delete :destroy
      expect(response).to redirect_to(questions_url)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new session cookie" do
        post :create, username: user.username, password: "robot"
        expect(session[:id]).to eq(user.id)
      end
      it "redirects to the questions list" do
        post :create, username: user.username, password: "robot"
        expect(response).to redirect_to(questions_url)
      end
    end

    context "with invalid attributes" do
      it "does not create a session cookie" do
        post :create, username: nil
        expect(session[:id]).to be_blank
      end
      it "re-renders the :new template" do
        post :create, username: nil
        expect(response).to redirect_to(new_session_url)
      end
    end
  end 

end