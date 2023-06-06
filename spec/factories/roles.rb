FactoryBot.define do
  factory :role do
    name { Faker::Lorem.unique.word }
    type { "Role" }
    association :team, factory: :team
  end
end
