class Task < ApplicationRecord
  belongs_to :user

  enum status: { para_fazer: 0, fazendo: 1, feito: 2 }

  validates :title, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
