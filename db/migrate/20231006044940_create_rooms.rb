class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.integer :room_category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
