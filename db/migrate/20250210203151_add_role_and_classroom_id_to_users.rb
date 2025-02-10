class AddRoleAndClassroomIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :string
    add_column :users, :classroom_id, :integer
    add_index  :users, :classroom_id
    add_foreign_key :users, :classrooms, column: :classroom_id
  end
end
