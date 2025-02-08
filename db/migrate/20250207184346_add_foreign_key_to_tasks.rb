class AddForeignKeyToTasks < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :tasks, :users
  end
end
