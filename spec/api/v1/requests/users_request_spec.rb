require 'rails_helper'

RSpec.describe 'User API' do
  describe 'create' do
    it 'creates a user' do
      user_payload = {
        username: 'Roald1991',
        first_name: 'Roald',
        last_name: 'Roaldington',
        email: 'RoaldRules91@Gmail.Com',
        password: 'PenguinsRule11',
        password_confirmation: 'PenguinsRule11'
      }

      expect(User.all.count).to eq(0)

      post '/api/v1/users', params: user_payload, as: :json

      expect(response).to be_successful
      expect(User.all.count).to eq(1)
      expect(User.first.username).to eq(user_payload[:username])
      expect(User.first.first_name).to eq(user_payload[:first_name])
      expect(User.first.last_name).to eq(user_payload[:last_name])
      expect(User.first.email).to eq(user_payload[:email])
    end
  end
end
