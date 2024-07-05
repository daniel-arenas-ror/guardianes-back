class CreateServiceDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :service_deals do |t|
      t.references :service, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
