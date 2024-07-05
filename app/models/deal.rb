class Deal < ApplicationRecord
  validates :serial, presence: true

  has_many :service_deals
  has_many :services, through: :service_deals

  has_many :worker_deals
  has_many :workers, through: :worker_deals

  accepts_nested_attributes_for :service_deals, :worker_deals
end
