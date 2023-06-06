FactoryBot.define do
  factory :role_access do
    association :role, factory: :role
    association :access, factory: :access
  end
end
