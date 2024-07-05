class AddDealToScheduledWork < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedule_weeks, :deal, null: false, foreign_key: true
  end
end
