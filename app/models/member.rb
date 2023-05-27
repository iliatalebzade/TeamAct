class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :team_role, class_name: 'TeamRole'
end
