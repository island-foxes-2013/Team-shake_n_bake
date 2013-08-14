require 'spec_helper'

describe QuestionsController do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  # SHIT DONT WORK
  # describe "retrieves @questions" do
  #   it "assigns the requested questions to @questions" do
  #     get :index, questions: Question.search(params[:search]).paginate(page: params[:page]).order('id DESC')
  #     assigns(:questions).should eq(@questions)
  #   end
  # end
end