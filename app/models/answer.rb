class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments
  attr_accessible :body, :user_id, :question_id
  has_many :votes

  validates :body, presence: true
end
