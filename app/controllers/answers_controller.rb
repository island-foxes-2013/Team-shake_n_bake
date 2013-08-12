class AnswersController < ApplicationController
  def index
  end

  def new
  	@answer = Answer.new
  	@question = Question.find(params[:question_id])
  end

  def create
    user = User.find(session[:id])
    answer = user.answers.new(params[:answer])

    if answer.save
       render json: { answer: answer }
    else
      render json: { error: answer.errors }
    end
  end

  def destroy
  end

  def show
    @answer = Answer.find_by_id(params[:id])
    @comments = @answer.comments
    @comment = Comment.new
  end
end
