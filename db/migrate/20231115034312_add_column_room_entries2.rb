class AddColumnRoomEntries2 < ActiveRecord::Migration[6.1]
  def change
    add_column :room_entries, :room_id, :integer
  end
end
