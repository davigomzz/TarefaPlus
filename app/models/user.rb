class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  has_many :tasks, foreign_key: "teacher_id", dependent: :destroy
  has_many :task_students, foreign_key: "student_id", dependent: :destroy
  belongs_to :classroom, optional: true

  before_validation :capitalize_name

  validate :classroom_consistency
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true 

  enum role: { aluno: 1 , professor: 2}


  before_validation :capitalize_name


  private

  def classroom_consistency
    if professor? && classroom_id.present?
      errors.add(:classroom_id, "deve ser vazio para professores")
    elsif aluno? && classroom_id.blank?
      errors.add(:classroom_id, "deve ser preenchido para alunos")
    end
  end

  def capitalize_name
    self.name = name.capitalize if name.present?
  end
end
