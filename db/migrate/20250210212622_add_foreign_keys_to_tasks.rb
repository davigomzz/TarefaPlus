class AddForeignKeysToTasks < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :tasks, :users, column: :teacher_id
    add_foreign_key :tasks, :classrooms, column: :classroom_id
  end
end
