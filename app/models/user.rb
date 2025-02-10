class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  before_validation :capitalize_name

  private

  def capitalize_name
    self.name = name.capitalize if name.present?
  end
end
