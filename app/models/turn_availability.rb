class TurnAvailability < ApplicationRecord
  belongs_to :turn
  belongs_to :worker

  validates :turn, uniqueness: { scope: :worker }
end
