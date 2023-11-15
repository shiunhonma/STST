class AddColumnRoom < ActiveRecord::Migration[6.1]
  def change

    add_column :rooms, :comment, :text
    add_column :room_entries, :user_id, :integer
  end
end
