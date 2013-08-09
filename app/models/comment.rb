class Comment < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :answer
  attr_accessible :content, :user_id

  validates_presence_of :content
end
