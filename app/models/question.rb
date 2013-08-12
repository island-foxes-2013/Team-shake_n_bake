class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :votetable
  has_many :comments, as: :commentable
  belongs_to :user
  attr_accessible :title, :body, :user_id, :image
  validates :title, :body, presence: true

  mount_uploader :image, Uploader


  def self.search(search)
    if search
      where('title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
