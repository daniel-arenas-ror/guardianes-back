class Turn < ApplicationRecord
  belongs_to :worker, optional: true
  belongs_to :service_deal

  has_many :turn_availabilities

  validates :key, :week, :turn_date, :hour, presence: true
  validates :key, uniqueness: true
end
