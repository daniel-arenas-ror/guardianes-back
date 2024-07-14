class TurnAvailability < ApplicationRecord
  belongs_to :turn
  belongs_to :worker

  validates :turn_id, uniqueness: { scope: :worker_id }
end
