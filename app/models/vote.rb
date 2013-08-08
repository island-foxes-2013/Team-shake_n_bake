class Vote < ActiveRecord::Base
  # TODO: need both user_id and user here?
  attr_accessible :user_id, :user, :answer_id
  belongs_to :user
  belongs_to :answer
  
  #validates :user_id, :answer_id, presence: true
  validates :user_id, :answer_id, presence: true
  validates_associated :user, :answer
  validates_uniqueness_of :user_id, scope: :answer_id
end
