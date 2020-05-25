class User < ApplicationRecord
  has_many :posts

  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, :password, presence: true
  validates :email, :password, uniqueness: true
end
