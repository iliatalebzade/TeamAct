require 'rails_helper'

RSpec.describe "CountriesController", type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns all countries as @countries' do
      country1 = FactoryBot.create(:country)
      country2 = FactoryBot.create(:country)

      get :index
      expect(assigns(:countries)).to eq([country1, country2])
    end
  end

  # Add more tests for other controller actions
end
