require 'rails_helper'

RSpec.describe 'User API' do
  before :each do
    @user = User.create(username: 'Larry1231', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRocks21@Gmail.Com', password: '123Password', password_confirmation: '123Password')
  end

  describe '#create' do
    it 'creates a user' do
      user_payload = {
        username: 'Roald1991',
        first_name: 'Roald',
        last_name: 'Roaldington',
        email: 'RoaldRules91@Gmail.Com',
        password: 'PenguinsRule11',
        password_confirmation: 'PenguinsRule11'
      }

      expect(User.all.count).to eq(1)

      post '/api/v1/users', params: user_payload, as: :json

      expect(response).to be_successful

      user_response = JSON.parse(response.body, symbolize_names: true)

      expect(User.all.count).to eq(2)

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

      expect(User.all.count).to eq(1)

      post '/api/v1/users', params: user_payload, as: :json

      expect(response).to_not be_successful

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response[:data][:attributes][:errors]).to eq(["First name can't be blank", "Password confirmation doesn't match Password"])
    end
  end

  describe '#update' do
    it 'updates a users attribute(s)' do
      user_payload = {
        email: 'RoaldRocks1122@MSN.Com'
      }

      expect(@user.email).to_not eq(user_payload[:email])

      patch "/api/v1/users/#{@user.id}", params: user_payload, as: :json

      expect(response).to be_successful

      updates_to_user = JSON.parse(response.body, symbolize_names: true)

      expect(updates_to_user[:data][:attributes][:updates][:email]).to eq(user_payload[:email])
    end

    it 'returns error when user is not found' do
      user_payload = {
        email: 'RoaldRocks1122@MSN.Com'
      }

      expect(@user.email).to_not eq(user_payload[:email])

      patch "/api/v1/users/643523425", params: user_payload, as: :json

      expect(response).to_not be_successful

      no_user_error = JSON.parse(response.body, symbolize_names: true)

      expect(no_user_error[:data][:attributes][:errors]).to eq('No user found for given id.')
    end
  end

  describe '#destroy' do
    it 'deletes a given user' do
      delete "/api/v1/users/#{@user.id}"

      expect(response).to be_successful

      deleted_user_response = JSON.parse(response.body, symbolize_names: true)

      expect(deleted_user_response[:data][:attributes][:message]).to eq('User has been deleted.')
    end

    it 'returns error when user does not exist' do
      delete "/api/v1/users/45242"

      expect(response).to_not be_successful

      no_user_error = JSON.parse(response.body, symbolize_names: true)

      expect(no_user_error[:data][:attributes][:errors]).to eq('No user found for given id.')
    end
  end

  describe '#index' do
    it 'returns all users' do
      get '/api/v1/users'

      expect(response).to be_successful

      users = JSON.parse(response.body, symbolize_names: true)

      expect(users[:data][:attributes][:users][0][:username]).to eq('Larry1231')
    end
  end

  describe '#show' do
    it 'returns a given user' do
      get "/api/v1/users/#{@user.id}"

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:username]).to eq(@user.username)
    end

    it 'returns an error if given user is not found' do
      get "/api/v1/users/9299232"

      expect(response).to_not be_successful

      user_error = JSON.parse(response.body, symbolize_names: true)

      expect(user_error[:data][:attributes][:errors]).to eq('No user found for given id.')
    end
  end
end
