class AddForeignKeysToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :classroom_id, :integer
    add_index :tasks, :classroom_id
    add_foreign_key :tasks, :users, column: :teacher_id
    add_foreign_key :tasks, :classrooms, column: :classroom_id
  end
end
