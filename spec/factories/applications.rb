FactoryBot.define do
  factory :application do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip }
    description { Faker::Lorem.paragraph(sentence_count: 4, supplemental: false, random_sentences_to_add: 4) }
    status { "In Progress" }
  end
end
