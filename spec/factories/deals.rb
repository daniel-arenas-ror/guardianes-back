FactoryBot.define do
  factory :deal do
    serial { Faker::Config.random.seed }
  end
end
