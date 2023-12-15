class RenameStudentMemderColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :student_memder,:student_member
  end
end
