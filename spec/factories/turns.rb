FactoryBot.define do
  factory :turn do
    worker
    week { Faker::Number.within(range: 0..52) }
    service_deal
    turn_date { Faker::Date.between(from: Date.today.beginning_of_week, to: Date.today.end_of_week) }
    hour { Faker::Number.within(range: 0..23) }
    key { "#{hour}_#{turn_date.strftime("%d_%m_%Y")}" }
  end
end
