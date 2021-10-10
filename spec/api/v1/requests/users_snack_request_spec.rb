require 'rails_helper'

RSpec.describe 'UsersSnack API' do
  before :each do
    @user = User.create(username: 'Larry1231', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRocks21@Gmail.Com', password: '123Password', password_confirmation: '123Password')
    @snack_1 = Snack.create!(name: 'Funyuns', description: 'DELICIOUS', savory: true, sweet: false, rating: 4.5)
    @snack_2 = Snack.create!(name: 'Kit-Kat', description: 'Amazing', savory: false, sweet: true, rating: 3.77)
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
end
