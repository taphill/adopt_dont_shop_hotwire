FactoryBot.define do
  factory :veterinary_office do
    name { Faker::Lorem.word }
    max_patient_capacity { Faker::Number.within(range: 10..50) }
    boarding_services { true }
  end
end
