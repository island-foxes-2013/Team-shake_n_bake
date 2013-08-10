class VotesController < ApplicationController

  def create
    p params
    # vote = Vote.new(params[:vote].merge(user: current_user))
    # if vote.save
    #   render json: {
    #     num_votes: vote.answer.votes.count
    #   }
    # else
    #   render json: {
    #     errors: vote.errors.full_messages
    #   }, status: :unprocessible_entity
    # end
  end
end