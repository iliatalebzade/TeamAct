require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    # Add your validations tests here
  end

  describe 'associations' do
    it { should belong_to(:user).dependent(:destroy) }
    # Add your associations tests here
  end

  describe 'methods' do
    # Add your methods tests here
  end
end
