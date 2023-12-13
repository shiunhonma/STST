class RenameRoomCategoryColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :room_category, :room_category_id
  end
end
