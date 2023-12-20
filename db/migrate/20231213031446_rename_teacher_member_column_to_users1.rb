class RenameTeacherMemberColumnToUsers1 < ActiveRecord::Migration[6.1]
  def change
    rename_column :users,:taught_member,:teacher_memder
  end
end
