class AnswersController < ApplicationController
  def index
  end

  def create
    user = User.find(session[:id])
    answer = user.answers.new(params[:answer])

    if answer.save
      render json: {
        html: render_to_string(partial: 'shared/answer', locals: {answer: answer})
      }
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
