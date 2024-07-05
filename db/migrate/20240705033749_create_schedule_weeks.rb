class CreateScheduleWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :schedule_weeks do |t|
      t.integer :day, null: false
      t.integer :from, null: false
      t.integer :to, null: false

      t.timestamps
    end
  end
end
