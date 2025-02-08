class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  
  has_many :tasks, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
