class CreateClassroomsTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :classrooms_teachers do |t|
      t.integer :classroom_id, null: false
      t.integer :teacher_id,   null: false
      t.timestamps
    end

    add_index :classrooms_teachers, :classroom_id
    add_index :classrooms_teachers, :teacher_id

    add_foreign_key :classrooms_teachers, :classrooms, column: :classroom_id
    add_foreign_key :classrooms_teachers, :users, column: :teacher_id
  end
end
