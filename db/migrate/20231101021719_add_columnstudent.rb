class AddColumnstudent < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :taught_member, :integer
    add_column :users, :student_member, :integer
  end
end
