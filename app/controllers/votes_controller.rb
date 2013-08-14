class VotesController < ApplicationController

  def create
    user = current_user
    vote_request = params[:vote]

    if params.has_key?('question_id')
      question = Question.find(params[:question_id])
      vote = Vote.create_vote(question, user, vote_request)
      vote_count = (question.votes.where(vote: 'up').count) - (question.votes.where(vote: 'dwn').count)
        render json: { vote: vote, count: vote_count }
    elsif params.has_key?('answer_id')
      answer = Answer.find(params[:answer_id])
      vote = Vote.create_vote(answer, user, vote_request)
      vote_count = (answer.votes.where(vote: 'up').count) - (answer.votes.where(vote: 'dwn').count)
        render json: { vote: vote, count: vote_count }

    else
      render json: { error: 'something went terribly wrong' }
    end
  end
end

