class Worker < ApplicationRecord
  validates :name, :color, presence: true
end
