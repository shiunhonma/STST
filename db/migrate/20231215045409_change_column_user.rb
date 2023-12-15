class ChangeColumnUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :Users, :taught_member, :teacher_member
  end
end
