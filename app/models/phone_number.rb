class PhoneNumber < ApplicationRecord
  belongs_to :user
  belongs_to :country

  validate :validate_phone_number

  private

  def validate_phone_number
    unless Phonelib.valid?(number, user.country.phone_code)
      errors.add(:number, 'is not a valid phone number')
    end
  end
end
