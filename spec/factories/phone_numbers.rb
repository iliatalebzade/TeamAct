FactoryBot.define do
  factory :phone_number do
    number { Faker::PhoneNumber.phone_number }
    association :user, factory: :user
    association :country, factory: :country
  end
end
