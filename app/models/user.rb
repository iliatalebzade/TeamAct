class User < ApplicationRecord
  attr_accessor :phone_number_country_code, :phone_number_digits
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, length: { maximum: 50 },
    format: { with: /\A[a-zA-Z0-9!@#$%^&*_+=\\-\\.?><()]+\z/, message: "can only contain letters, numbers, and special characters" }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :date_of_birth, presence: true
  validate :date_of_birth_cannot_be_in_future

  has_secure_password

  enum gender: { male: 0, female: 1 }

  belongs_to :role, class_name: 'Role'
  belongs_to :city
  has_one :country, through: :city
  has_one :phone_number, dependent: :destroy
  has_many :addresses, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def date_of_birth_cannot_be_in_future
    errors.add(:date_of_birth, "cannot be in the future") if date_of_birth.present? && date_of_birth.future?
  end
end
