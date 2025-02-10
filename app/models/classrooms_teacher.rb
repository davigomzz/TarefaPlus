class ClassroomsTeacher < ApplicationRecord
  belongs_to :classroom
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
end
