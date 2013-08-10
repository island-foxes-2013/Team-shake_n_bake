class CommentsController < ApplicationController
  def create
  	 	p params[:question_id]
  	 	user = User.find(session[:id])
  	 if params.has_key?('question_id')
       @comment = Question.find(params[:question_id]).comments.create(content: params[:comment], user_id: user.id)
       # render json: render_to_string(partial: 'form', locals: { bananas: 'hello' }).to_json
       # format.json { render json: @comment, status: :create, location: @comment}   
      render json: { comment: @comment, user: user }
     end
# redirect_to question_path(params[:question_id])
 
    # answer = Answer.find_by_id(params[:answer_id])
    # answer.comments.create(user_id: session[:id], content: params[:comment][:content])
    # redirect_to question_path(answer.question_id)
  end
end

# def create

#     if params.has_key?('question_id')
#       Question.find(params[:question_id]).comments.create(content: params[:comment][:content], user_id: session[:id])
#       redirect_to question_path(params[:question_id])
#     elsif params.has_key?('answer_id')
#       answer = Answer.find(params[:answer_id])
#       answer.comments.create(content: params[:comment][:content], user_id: session[:id])
#       redirect_to question_path(answer.question_id)
#     end
#   end


 # def new 
 #    if params.has_key?('question_id')
 #      @comment = Comment.new
 #      @commentable = Question.find(params[:question_id])
 #    elsif params.has_key?('answer_id')
 #      @comment = Comment.new
 #      @commentable = Answer.find(params[:answer_id])
 #    end
 #  end 