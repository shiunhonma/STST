class ChangeColumnUser < ActiveRecord::Migration[6.1]
  def change
<<<<<<< HEAD
    rename_column :users, :taught_member, :teacher_member
=======
    rename_column :users, :teacher_memder, :teacher_member
>>>>>>> 0aae33d09e1438112daf01e4d4358ca105a528a5
  end
end
