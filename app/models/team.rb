class Team < ApplicationRecord
  belongs_to :category
  has_many :team_roles, dependent: :destroy
  has_many :members, dependent: :destroy
end
