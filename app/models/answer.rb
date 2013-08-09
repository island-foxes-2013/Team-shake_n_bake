class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :votetable
  has_many :comments, as: :commentable

  attr_accessible :body, :user_id, :question_id

  validates :body, presence: true
end
