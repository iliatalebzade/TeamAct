class RoleAccess < ApplicationRecord
  belongs_to :role, dependent: :destroy
  belongs_to :access, dependent: :destroy
end
