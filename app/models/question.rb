class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_many :comments, as: :commentable
  attr_accessible :title, :body

  validates :title, :body, presence: true
end
