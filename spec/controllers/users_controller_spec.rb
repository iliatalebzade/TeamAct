require 'rails_helper'

RSpec.describe "UsersController", type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get "/users"
      expect(response).to have_http_status(:success)
    end

    it 'assigns all users as @users' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)

      get :index
      expect(assigns(:users)).to eq([user1, user2])
    end
  end

  describe 'POST /users' do
    context "With valid params" do
      it 'returns a 201 (created) response header upon successful sign up attempt.' do

      end
    end

    context "With invalid params" do
      it 'returns a  422 (unprocessable_entity) upon unsuccessful sign up attempt.' do
      end
    end
  end

  # Add more tests for other controller actions
end
