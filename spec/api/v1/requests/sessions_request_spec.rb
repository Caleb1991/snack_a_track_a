require 'rails_helper'


RSpec.describe 'Sessions API' do
  before :each do
    @user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
  end

  describe '#login_user' do
    it 'logs a user in if the username and password match' do
      post '/api/v1/sessions'

      logged_in_user = JSON.parse(response.body, symbolize_names: true)

      expect(logged_in_user[:data][:attributes][:messgae]).to eq('User successfully logged in.')
    end
  end
end
