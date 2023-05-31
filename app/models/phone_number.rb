class PhoneNumber < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :country

  validate :validate_phone_number

  private

  def validate_phone_number
    phone = Phonelib.parse(number)
    unless phone.valid_for_country?(country.iso2)
      errors.add(:number, 'is not a valid phone number')
    end
  end
end
