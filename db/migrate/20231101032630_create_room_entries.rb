class CreateRoomEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :room_entries do |t|
      t.text :comment
      t.boolean :flag
      t.integer :user_id

      t.timestamps
    end
  end
end
