class Vote < ActiveRecord::Base
  # TODO: need both user_id and user here?
  attr_accessible :user_id, :votetable_id, :votetable_type, :vote
  belongs_to :user
  belongs_to :votetable, polymorphic: true

  validates :user_id, :votetable_id, presence: true
  # validates_associated :user, :answer, :question
  validates_uniqueness_of :user_id, scope: :votetable_id

  def self.create_vote(q_a, user, vote_request)
  	@q_a = q_a
  	@user = user
  	@vote_request = vote_request
    @vote_check_result = self.check_vote
    if @vote_check_result == false
      if @vote_request == 'up'
        self.up_vote
        return 'You voted up'
      elsif @vote_request == 'dwn'
        self.dwn_vote
        return 'You voted down'
      end
    end
    @vote_check_result
  end

  def self.check_vote
    if @q_a.votes.where(user_id: @user.id).empty?
      return false
    else
      @vote = @q_a.votes.where(user_id: @user.id).first
      if @vote.vote == @vote_request
        return ('You already voted' + ' ' + @vote_request)
      else
        if @vote.vote == 'up'
          @vote.update_attribute(:vote, 'dwn')
          return 'You changed your vote to down'
        else
          @vote.update_attribute(:vote, 'up')
          return 'You changed your vote to up'
        end 
      end
    end
  end

  def self.up_vote
    @q_a.votes.create(user_id: @user.id, vote: 'up')
  end

  def self.dwn_vote
    @q_a.votes.create(user_id: @user.id, vote: 'dwn')
  end
end
