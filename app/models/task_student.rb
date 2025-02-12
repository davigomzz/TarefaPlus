class TaskStudent < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  belongs_to :task, optional: true

  def status_class
    case status
    when "para_fazer" then "danger"
    when "fazendo" then "warning"
    when "feito" then "success"
    else "secondary"
    end
  end

  enum status: { para_fazer: 0, fazendo: 1, feito: 2 }
  validates :status, inclusion: { in: statuses.keys }
end
