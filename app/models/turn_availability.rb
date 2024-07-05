class TurnAvailability < ApplicationRecord
  belongs_to :turn
  belongs_to :worker
end
