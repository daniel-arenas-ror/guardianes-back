FactoryBot.define do
  factory :worker do
    name { Faker::Games::SuperMario.character }
    color { Faker::Color.hex_color }
  end
end
