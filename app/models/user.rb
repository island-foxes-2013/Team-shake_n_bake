class User < ActiveRecord::Base

  include Gravtastic
  gravtastic :default => 'http://1.bp.blogspot.com/-wI8cg--onZg/UDL2rXx7XUI/AAAAAAAAAhs/s0hDTgtlPEc/s320/shake.jpg',
             :size => 200,
             :filetype => :jpg
  
  has_many :questions
  has_many :answers
  has_many :comments

  # validates :username, :email, :password, :password_confirmation, presence: true
  validates :username, :email, presence: true

  validates :username, :email, uniqueness: true
  has_secure_password
  attr_accessible :username, :email, :password, :password_confirmation
  
end
