class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, foreign_key: "teacher_id", dependent: :destroy
  has_many :tasks_students, foreign_key: "student_id", dependent: :destroy
  belongs_to :classroom, optional: true

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true 

  before_validation :capitalize_name


  private

  def capitalize_name
    self.name = name.capitalize if name.present?
  end
end
