class Deal < ApplicationRecord
  validates :serial, presence: true

  has_many :service_deals
  has_many :services, through: :service_deals
end
