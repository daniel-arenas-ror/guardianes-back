class ScheduleWeek < ApplicationRecord
  belongs_to :deal

  validates :day, :from, :to, presence: true

  validates :day, inclusion: { in: 0..6 }
  validates :from, :to, inclusion: { in: 0..23 }
end
