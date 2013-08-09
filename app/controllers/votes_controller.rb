class VotesController < ApplicationController

  def create
     p "&" * 80
     p
    p "*" * 50
    p "ABOUT TO VOTE!"
    p Vote.count
    vote = Vote.new(params[:vote].merge(user: current_user))
    p vote
    p vote.user
    if vote.save
      p "SAVED"
      p Vote.count
      render json: {
        num_votes: vote.answer.votes.count
      }
    else
      # MOAR LOGGINGGGG
      p "VALIDATION FAILED"
      p vote.errors.full_messages.join(',')
      p Vote.count
      render json: {
        # TODO: this could be better
        errors: vote.errors.full_messages
      }, status: :unprocessible_entity
    end
  end

end