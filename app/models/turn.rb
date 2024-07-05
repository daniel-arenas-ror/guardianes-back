class Turn < ApplicationRecord
  belongs_to :worker
  belongs_to :service_deal

  validates :key, :week, presence: true
end
