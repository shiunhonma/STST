class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.text :message
      t.binary :attachment
      t.integer :user_id

      t.timestamps
    end
  end
end
