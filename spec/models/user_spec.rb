require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
    end

    # Additional validation tests...

    it "is not valid if the date of birth is in the future" do
      user = FactoryBot.build(:user, date_of_birth: Date.tomorrow)
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    # Add your associations tests here
  end

  describe 'methods' do
    # Add your methods tests here
  end
  # Additional tests for associations and other model logic...
end
