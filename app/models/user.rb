class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  validates :username, :email, :password, :password_confirmation, presence: true
  has_secure_password
  attr_accessible :username, :email, :password, :password_confirmation

  
end
