class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :status
      t.integer :teacher_id 
      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :teacher_id
  end
end
