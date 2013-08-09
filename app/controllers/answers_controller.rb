class AnswersController < ApplicationController
  def index
  end

  def new
  	@answer = Answer.new
  	@question = Question.find(params[:question_id])
  end

  def create
  	answer = Answer.new(params[:answer])
  	answer.user_id = current_user.id
  	answer.question_id = params[:question_id]
  	answer.save
  	redirect_to question_path(answer.question_id)
  end

  def destroy
  end

  def show
    @answer = Answer.find_by_id(params[:id])
    @comments = @answer.comments
    @comment = Comment.new
  end

end
