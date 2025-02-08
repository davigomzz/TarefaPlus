class RenameNomeToNameInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :nome, :name
  end
end
