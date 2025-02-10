class Classroom < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "classroom_id"

  has_many :classrooms_teachers
  has_many :teachers, through: :classrooms_teachers, source: :teacher

  has_many :tasks
end
