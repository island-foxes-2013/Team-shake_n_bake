class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :votetable
  has_many :comments, as: :commentable
  belongs_to :user
  attr_accessible :title, :body, :user_id
  validates :title, :body, presence: true
end
