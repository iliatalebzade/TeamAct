FactoryBot.define do
  factory :address do
    description { Faker::Lorem.sentence }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    association :user, factory: :user
  end
end
