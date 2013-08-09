class Vote < ActiveRecord::Base
  # TODO: need both user_id and user here?
  attr_accessible :user_id, :votetable_id, :votetable_type
  belongs_to :user
  belongs_to :votetable, polymorphic: true

  validates :user_id, :votetable_id, presence: true
  # validates_associated :user, :answer, :question
  validates_uniqueness_of :user_id, scope: :votetable_id
end
