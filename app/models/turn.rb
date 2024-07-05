class Turn < ApplicationRecord
  belongs_to :worker
  belongs_to :service_deal
end
