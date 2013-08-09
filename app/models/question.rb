class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :votetable
  belongs_to :user
  has_many :comments, as: :commentable
  attr_accessible :title, :body

  validates :title, :body, presence: true
end
