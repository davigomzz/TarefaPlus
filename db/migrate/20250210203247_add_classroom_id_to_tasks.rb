class AddClassroomIdToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :classroom_id, :integer
    add_index :tasks, :classroom_id
  end
end
