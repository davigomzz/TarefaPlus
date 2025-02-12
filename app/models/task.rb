class Task < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  belongs_to :classroom, optional: true

  def status_class
    case status
    when "para_fazer" then "danger"
    when "fazendo" then "warning"
    when "feito" then "success"
    else "secondary"
    end
  end

  validates :title, presence: true
end
