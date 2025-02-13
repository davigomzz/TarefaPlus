class CreateTaskStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :task_students do |t|
      t.integer :status
      t.integer :student_id
      t.belongs_to :task, null: false, foreign_key: true
    end
    add_index :task_students, :student_id
    add_foreign_key :task_students, :users, column: :student_id
  end
end
