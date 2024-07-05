class CreateWorkerDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_deals do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
