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
    p "check 1"
    @vote_check_result = self.check_vote
  	if @vote_check_result == false
  		p 'check 2'
  		if @vote_request == 'up'
  			self.up_vote
  			return 'voted up'
  		elsif @vote_request == 'dwn'
  			self.dwn_vote
  			return 'voted down'
  		end
  	end
  	@vote_check_result
  end

  def self.check_vote
  	p 'check 3'
  	if @q_a.votes.where(user_id: @user.id).empty?
  		p 'check false no votes'
  		return false
  	else
  		p 'made it through else'
  		@vote = @q_a.votes.where(user_id: @user.id).first
  		p @vote
  		p @vote.vote
  		p @vote_request
  		if @vote.vote == @vote_request
  			p 'this should be the raise statement'
  			return ('Already voted' + ' ' + @vote_request)
  		else
  			p 'trying to change the value in object'
        if @vote.vote == 'up'
        	p 'change to dwn'
        	@vote.update_attribute(:vote, 'dwn')
        	return 'vote changed down'
        else
        	p 'change to up'
        	@vote.update_attribute(:vote, 'up')
        	return 'vote changed up'
        end 
  	  end
  	end
  end

  def self.up_vote
  	@q_a.votes.create(user_id: @user.id, vote: 'up')
  	return 'up'
  end

  def self.dwn_vote
  	@q_a.votes.create(user_id: @user.id, vote: 'dwn')
  	return 'dwn'
  end
end
