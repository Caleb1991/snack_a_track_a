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

      user_response = JSON.parse(response.body, symbolize_names: true)

      expect(User.all.count).to eq(1)

      expect(user_response[:data][:attributes][:username]).to eq(user_payload[:username])
      expect(user_response[:data][:attributes][:first_name]).to eq(user_payload[:first_name])
      expect(user_response[:data][:attributes][:last_name]).to eq(user_payload[:last_name])
      expect(user_response[:data][:attributes][:email]).to eq(user_payload[:email])
    end

    it 'returns error messages when user cannot be created' do
      user_payload = {
        username: 'Roald1991',
        last_name: 'Roaldington',
        email: 'RoaldRules91@Gmail.Com',
        password: 'Penguinsle11',
        password_confirmation: 'PenguinsRule11'
      }

      expect(User.all.count).to eq(0)

      post '/api/v1/users', params: user_payload, as: :json

      expect(response).to_not be_successful

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response[:data][:attributes][:errors]).to eq(["First name can't be blank", "Password confirmation doesn't match Password"])
    end
  end
end
