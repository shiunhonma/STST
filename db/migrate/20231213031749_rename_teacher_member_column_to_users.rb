class RenameTeacherMemberColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :teacher_memder,:taught_member
  end
end
