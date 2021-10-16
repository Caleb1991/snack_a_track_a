require 'rails_helper'


RSpec.describe 'Sessions API' do
  before :each do
    @user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
  end

  describe '#index' do
    it 'logs a user in if the username and password match' do
      user_credentials = {
        username: 'Roald1991',
        password: 'PenguinsRule11'
      }

      post '/api/v1/sessions', params: user_credentials, as: :json

      expect(response).to be_successful

      logged_in_user = JSON.parse(response.body, symbolize_names: true)

      expect(logged_in_user[:data][:attributes][:message]).to eq('You have successfully logged in!')
    end

    it 'returns an error if the username or password do not match' do
      user_credentials = {
        username: 'Roald1991',
        password: 'PenguinsRe11'
      }

      post '/api/v1/sessions', params: user_credentials, as: :json

      expect(response).to_not be_successful

      unsuccessful_login = JSON.parse(response.body, symbolize_names: true)

      expect(unsuccessful_login[:data][:attributes][:message]).to eq('Your username or password is incorrect.')
    end
  end
end
