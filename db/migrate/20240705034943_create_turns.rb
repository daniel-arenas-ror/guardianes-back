class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.string :key
      t.references :worker, null: false, foreign_key: true
      t.integer :week
      t.references :service_deal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
