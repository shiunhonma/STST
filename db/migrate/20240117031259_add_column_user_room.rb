class AddColumnUserRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :user_rooms, :point_check, :boolean
  end
end
