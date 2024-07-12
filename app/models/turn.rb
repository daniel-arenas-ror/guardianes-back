class Turn < ApplicationRecord
  belongs_to :worker, optional: true
  belongs_to :service_deal

  has_many :turn_availabilities

  validates :key, :week, :turn_date, :hour, presence: true
  validates :key, uniqueness: true

  scope :with_availability, -> (turn_date, worker_available) {
    includes(:turn_availabilities)
    .where(
      turn_date: turn_date,
      turn_availabilities: {
        worker_id: worker_available
      }
    )
  }
end
