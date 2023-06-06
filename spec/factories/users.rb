FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { :male }
    password { 'password' }

    association :role, factory: :role
    association :city, factory: :city
    after(:create) do |user|
      create(:phone_number, user: user)
    end
  end
end
