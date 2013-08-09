class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :commentable, polymorphic: true
  attr_accessible :content, :user_id

  validates_presence_of :content
end