class AnswersController < ApplicationController
  def index
  end

  def new
  	@answer = Answer.new
  end

  def create
  	answer = Answer.new(params[:answer])
  	answer.save
  	redirect_to question_path(@question)
  end

  def destroy
  end

end
