class Country < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :iso3, presence: true, uniqueness: true
  validates :iso2, presence: true, uniqueness: true
  validates :phone_code, presence: true

  has_one_attached :flag
  has_many :cities
  has_many :users, through: :cities
end
