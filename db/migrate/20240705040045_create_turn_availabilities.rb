class CreateTurnAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :turn_availabilities do |t|
      t.references :turn, null: false, foreign_key: true
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
