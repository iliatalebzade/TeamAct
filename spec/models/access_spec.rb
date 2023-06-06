require 'rails_helper'

RSpec.describe Access, type: :model do
  describe 'validations' do
    it 'is valid with a route' do
      access = FactoryBot.build(:access)
      expect(access).to be_valid
    end

    it 'is invalid without a route' do
      access = FactoryBot.build(:access, route: nil)
      expect(access).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should have many role_accesses' do
      association = described_class.reflect_on_association(:role_accesses)
      expect(association.macro).to eq(:has_many)
    end
  end
end
