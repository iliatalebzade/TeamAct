class TeamRole < Role
  belongs_to :team, dependent: :destroy
end
