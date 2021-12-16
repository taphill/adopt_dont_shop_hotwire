FactoryBot.define do
  factory :veterinarian do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    review_rating { Faker::Number.within(range: 1..5) }
    on_call { true }
    association :veterinary_office
  end
end
