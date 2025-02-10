class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, foreign_key: "teacher_id", dependent: :destroy
  belongs_to :classroom, optional: true
  has_many :classrooms_teachers, foreign_key: "teacher_id", dependent: :destroy
  has_many :teaching_classrooms, through: :classrooms_teachers, source: :classroom
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true 

  before_validation :capitalize_name


  private

  def capitalize_name
    self.name = name.capitalize if name.present?
  end
end
