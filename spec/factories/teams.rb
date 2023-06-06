FactoryBot.define do
  factory :team do
    name { Faker::Lorem.word }
    association :category, factory: :category
  end
end
