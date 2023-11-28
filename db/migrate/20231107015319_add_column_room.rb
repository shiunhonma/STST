class AddColumnRoom < ActiveRecord::Migration[6.1]
  def change

    add_column :rooms, :comment, :text
  end
end
