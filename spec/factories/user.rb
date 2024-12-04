FactoryBot.define do
  factory :user do
    id {Faker::Number.between(from: 1, to: 10)}
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name}
    email { Faker::Internet.email}
    created_at {Time.now}
    updated_at {Time.now}
  end
end