class AddColumnicon < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :icon, :binary
  end
end
