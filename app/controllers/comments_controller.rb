class CommentsController < ApplicationController
  def create
  	 	user = User.find(session[:id])
  	if params.has_key?('question_id')
      @comment = Question.find(params[:question_id]).comments.create(content: params[:comment], user_id: user.id)  
      render json: { comment: @comment, user: user }
    elsif params.has_key?('answer_id')
      @comment = Answer.find(params[:answer_id]).comments.create(content: params[:comment], user_id: user.id)  
      render json: { comment: @comment, user: user }
    else
      render json: { error: 'something went terribly wrong'}
    end
  end
end