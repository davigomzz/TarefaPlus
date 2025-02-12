class Task < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  belongs_to :classroom, optional: true
  validates :title, presence: true
end
