class Task < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  belongs_to :classroom, optional: true
  validates :title, presence: true

  scope :for_classroom, ->(classroom_id) { where(classroom_id: classroom_id) }
  scope :not_taken_by, ->(user) { where.not(id: user.task_students.select(:task_id)) }
  
end
