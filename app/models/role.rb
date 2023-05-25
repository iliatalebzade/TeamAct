class Role < ApplicationRecord
  has_many :role_access, dependent: :destroy
  has_many :access, through: :role_access
end
