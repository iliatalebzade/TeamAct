FactoryBot.define do
  factory :access do
    route { Faker::Internet.unique.url }
  end
end
