class RenameStudentMemberColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :student_member,:teacher_memder
  end
end
