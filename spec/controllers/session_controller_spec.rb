require 'rails_helper'

RSpec.describe "SessionController", type: :controller do
  describe 'POST #create' do
    it 'returns a success response' do
      post :create, params: { username: 'user', password: 'password' }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the user as current_user' do
      user = FactoryBot.create(:user, username: 'user', password: 'password')

      post :create, params: { username: 'user', password: 'password' }
      expect(controller.current_user).to eq(user)
    end
  end

  # Add more tests for other controller actions
end
