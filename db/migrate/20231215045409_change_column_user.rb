class ChangeColumnUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :teacher_memder, :teacher_member
  end
end
