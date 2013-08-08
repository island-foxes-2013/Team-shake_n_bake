class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  attr_accessible :title, :body

  validates :title, :body, presence: true
end
