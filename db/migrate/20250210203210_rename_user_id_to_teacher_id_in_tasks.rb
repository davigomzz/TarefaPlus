class RenameUserIdToTeacherIdInTasks < ActiveRecord::Migration[7.1]
  def change
    if index_name_exists?(:tasks, "index_tasks_on_user_id")
      remove_index :tasks, name: "index_tasks_on_user_id"
    end

    rename_column :tasks, :user_id, :teacher_id

    unless index_name_exists?(:tasks, "index_tasks_on_teacher_id")
      add_index :tasks, :teacher_id
    end
  end
end
