class Classroom < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "classroom_id"


  has_many :tasks
end
