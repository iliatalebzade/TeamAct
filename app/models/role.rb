class Role < ApplicationRecord
  has_many :role_access, dependent: :destroy
  has_many :access, through: :role_access

  self.inheritance_column = 'role_type'

end
