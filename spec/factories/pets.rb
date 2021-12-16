FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    age { Faker::Number.within(range: 1..10) }
    breed { Faker::Creature::Dog.breed }
    adoptable { true }
    association :shelter
  end
end
