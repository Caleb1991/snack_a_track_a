require 'rails_helper'

RSpec.describe 'UsersSnack API' do
  before :each do
    @user = User.create(username: 'Larry1231', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRocks21@Gmail.Com', password: '123Password', password_confirmation: '123Password')
    @snack_1 = Snack.create!(name: 'Funyuns', description: 'DELICIOUS', savory: true, sweet: false)
    @snack_2 = Snack.create!(name: 'Kit-Kat', description: 'Amazing', savory: false, sweet: true)
    @users_snack = UsersSnack.create!(user_id: @user.id, snack_id: @snack_1.id)
  end

  describe '#create' do
    it 'creates a users_snack' do
      users_snack_payload = {
        user_id: @user.id,
        snack_id: @snack_2.id
      }

      post '/api/v1/users_snacks', params: users_snack_payload, as: :json

      expect(response).to be_successful

      created_users_snack = JSON.parse(response.body, symbolize_names: true)

      expect(created_users_snack[:data][:attributes][:user_id]).to eq(@user.id)
      expect(created_users_snack[:data][:attributes][:snack_id]).to eq(@snack_2.id)
    end

    it 'returns errors if missing fields' do
      users_snack_payload = {
        user_id: @user.id
      }

      post '/api/v1/users_snacks', params: users_snack_payload, as: :json

      expect(response).to_not be_successful

      users_snack_error = JSON.parse(response.body, symbolize_names: true)

      expect(users_snack_error[:data][:attributes][:errors]).to eq(["Snack can't be blank", "Snack must exist"])
    end
  end

  describe '#delete' do
    it 'deletes a users_snack' do
      delete "/api/v1/users_snacks/#{@users_snack.id}"

      expect(response).to be_successful

      deletion_message = JSON.parse(response.body, symbolize_names: true)

      expect(deletion_message[:data][:attributes][:message]).to eq('Users snack successfully deleted.')
    end

    it 'returns an error if users snack does not exist' do
      delete "/api/v1/users_snacks/9237223"

      expect(response).to_not be_successful

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:data][:attributes][:message]).to eq('Users snack not found for given id.')
    end
  end
end
