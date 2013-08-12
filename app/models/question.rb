class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :votetable
  has_many :comments, as: :commentable
  belongs_to :user
  attr_accessible :title, :body, :user_id, :image
  validates :title, :body, presence: true

  mount_uploader :image, Uploader


  def self.search(search)
    return scoped unless !search.blank? # same as 'all', except can call order on it (see QuestionsController)
    where('title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%")
  end

end
