require 'spec_helper'

describe QuestionsController do

  describe "GET #index" do
    it "assigns a list of questions and a user" do
      get :index
      assigns[:user].should be_new_record
      assigns[:questions].should eq(Question.all)
    end
  end

  describe "GET #show" do
    it "assigns the requested question to @question"
    it "renders the show template"
  end

  describe "GET #new" do
    it "assigns a new Question to @question"
    it "renders the new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new question in the database"
      it "redirects to the question show page"
    end

    context "with invalid attributes" do
      it "does not save the new question in the database"
      it "re-renders the :new template"
    end
  end
end