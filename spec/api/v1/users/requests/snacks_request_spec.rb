require 'rails_helper'

RSpec.describe 'User Snack API' do
  before :each do
    @user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')

    @snack_1 = Snack.create!(name: 'Funyuns', description: 'DELICIOUS', savory: true, sweet: false)
    @snack_2 = Snack.create!(name: 'Star Crunch', description: 'AMAZING', savory: false, sweet: true)

    @users_snack_1 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_1.id)
    @users_snack_2 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_2.id)
  end

  describe '#index' do
    it 'returns all of a given users snacks' do
      get "/api/v1/users/#{@user_1.id}/snacks"

      expect(response).to be_successful

      snacks = JSON.parse(response.body, symbolize_names: true)

      expect(snacks[:data][:attributes][0][:name]).to eq(@snack_1.name)
    end
  end
end
