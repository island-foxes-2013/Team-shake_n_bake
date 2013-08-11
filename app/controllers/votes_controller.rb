class VotesController < ApplicationController

  def create
    user = User.find(session[:id])
    vote_request = params[:vote]

    if params.has_key?('question_id')
      question = Question.find(params[:question_id])
      vote = Vote.create_vote(question, user, vote_request)
      render json: { vote: vote, count: question.votes.where(vote: 'up').count }
    elsif params.has_key?('answer_id')
      answer = answer.find(params[:answer_id])
      vote = Vote.create_vote(answer, user, vote_request)
      render json: { vote: vote, count: answer.votes.where(vote: 'up').count }
    else
      render json: { error: 'something went terribly wrong' }
    end
  end
end

