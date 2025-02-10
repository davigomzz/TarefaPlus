class Task < ApplicationRecord
  belongs_to :user

  enum status: { para_fazer: 0, fazendo: 1, feito: 2 }

  def status_class
    case status
    when "para_fazer" then "danger"
    when "fazendo" then "warning"
    when "feito" then "success"
    else "secondary"
    end
  end

  validates :title, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
