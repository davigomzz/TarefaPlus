class TaskStudent < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  belongs_to :task, optional: true

  enum status: { para_fazer: 0, fazendo: 1, feito: 2 }
  validates :status, inclusion: { in: statuses.keys }
end
