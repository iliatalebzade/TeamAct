FactoryBot.define do
  factory :member do
    association :user, factory: :user
    association :team, factory: :team
    association :team_role, factory: :role
  end

end
