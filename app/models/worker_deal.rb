class WorkerDeal < ApplicationRecord
  belongs_to :worker
  belongs_to :deal

  delegate :name, to: :worker
end
