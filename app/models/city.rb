class City < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100}

  belongs_to :country
  has_many :users
end
