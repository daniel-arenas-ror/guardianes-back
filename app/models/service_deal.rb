class ServiceDeal < ApplicationRecord
  belongs_to :service
  belongs_to :deal

  delegate :name, to: :service
end
