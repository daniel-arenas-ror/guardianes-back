FactoryBot.define do
  factory :service do
    name { Faker::Games::Dota.item }
  end
end
