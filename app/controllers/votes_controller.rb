class VotesController < ApplicationController

  def create
    p params
    user = User.find(session[:id])
    vote_request = params[:vote]
    if params.has_key?('question_id')
      question = Question.find(params[:question_id])
      vote = Vote.create_vote(question, user, vote_request)
      p "%" * 80
      p vote
      render json: { vote: vote }
    end

    
    
 

  

    #       if vote.errors
    #         render json: { errors: vote.errors }
    #       else
    #         render json: { vote: question.votes.count }
    #       end
    #     elsif params[:vote] == 'dwn'
       
    #       if 
    #     end
    # end

    # if params.has_key?('answer_id')
    #   answer = Answer.find(params[:answer_id])
    #   if params[:vote] == 'up'
    #     vote = answer.votes.create(user: session[:id])
    #     if vote.errors
    #       render json: { errors: false }
    #     else
    #       render json: { vote: answer.votes.count }
    #     end
    #   end
    # end


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