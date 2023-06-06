FactoryBot.define do
  factory :country do
    name { Faker::Address.unique.country }
    iso3 { Faker::Address.unique.country_code_long }
    phone_code { Faker::PhoneNumber.unique.country_code }
    region { Faker::Address.unique.region }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    iso2 { Faker::Address.unique.country_code }
    emoji { Faker::Address.unique.country_code }
  end
end
