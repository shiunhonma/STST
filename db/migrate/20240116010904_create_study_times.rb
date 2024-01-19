class CreateStudyTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :study_times do |t|
      t.integer :user_id
      t.date :date
      t.integer :time

      t.timestamps
    end
  end
end
