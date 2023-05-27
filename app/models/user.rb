class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :date_of_birth, presence: true
  validate :date_of_birth_cannot_be_in_future

  has_secure_password

  enum gender: { male: 0, female: 1 }

  belongs_to :role, class_name: 'Role'
  belongs_to :city
  belongs_to :country, through: :city
  has_one :phone_number

  validates :password, length: { minimum: 6 }, if: -> { password.present? }s
  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def date_of_birth_cannot_be_in_future
    errors.add(:date_of_birth, "cannot be in the future") if date_of_birth.present? && date_of_birth.future?
  end
end
