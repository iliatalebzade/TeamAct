class Country < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :code, presence: true, uniqueness: true
  validates :phone_code, presence: true, uniqueness: true

  has_one_attached :flag
  has_many :cities
  has_many :users, through: :cities
end
