class Member < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :team, dependent: :destroy
  belongs_to :team_role, class_name: 'TeamRole'
end
