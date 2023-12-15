class RenameTaughtMemberColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :taught_member,:student_memder
  end
end
