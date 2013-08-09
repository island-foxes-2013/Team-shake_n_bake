class CommentsController < ApplicationController
  def create
    answer = Answer.find_by_id(params[:answer_id])
    answer.comments.create(user_id: session[:id], content: params[:comment][:content])
    redirect_to question_path(answer.question_id)
  end
end
