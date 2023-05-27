class PhoneNumber < ApplicationRecord
  belongs_to :user
  belongs_to :phone_number_format

  validate :validate_phone_number

  private

  def validate_phone_number
    unless Phonelib.valid?(number, phone_number_format.country.code)
      errors.add(:number, 'is not a valid phone number')
    end
  end
end
