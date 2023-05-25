class Team < ApplicationRecord
  belongs_to :category
  has_many :team_roles
  has_many :members
end
