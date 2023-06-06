FactoryBot.define do
  factory :city do
    name { Faker::Address.unique.city }
    association :country, factory: :country
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
