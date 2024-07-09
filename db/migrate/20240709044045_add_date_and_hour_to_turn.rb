class AddDateAndHourToTurn < ActiveRecord::Migration[7.0]
  def change
    add_column :turns, :turn_date, :date
    add_column :turns, :hour, :integer
  end
end
