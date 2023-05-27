class PhoneNumberFormat < ApplicationRecord
  validates :format, presence: true

  belongs_to :country
  has_many :phone_numbers
end
