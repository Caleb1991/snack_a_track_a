require 'rails_helper'

RSpec.describe 'Snack API' do
  before :each do
    @user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
    @user_2 = User.create!(username: 'Larry1122', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')

    @snack_1 = Snack.create!(name: 'Funyuns', description: 'Oniony', savory: true, sweet: false)
    @snack_2 = Snack.create!(name: 'Star Crunch', description: 'Made with nougat..... I think?', savory: false, sweet: true)
    @snack_3 = Snack.create!(name: 'Honey Bun', description: 'Honey and Bun-y', savory: false, sweet: true)
    @snack_4 = Snack.create!(name: 'Doritos', description: 'Bold', savory: true, sweet: false)
    @snack_5 = Snack.create!(name: 'Cheetos', description: 'The one with the cheetah', savory: true, sweet: false)
    @snack_6 = Snack.create!(name: 'Nachos', description: 'Not bad', savory: true, sweet: false)
    @snack_7 = Snack.create!(name: 'Hot Dogs', description: 'Also not impressive', savory: true, sweet: false)

    @users_snack_1 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_1.id)
    @users_snack_2 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_2.id)
    @users_snack_3 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_3.id)
    @users_snack_4 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_4.id)
    @users_snack_5 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_5.id)
    @users_snack_6 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_6.id)
    @users_snack_7 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_7.id)
    @users_snack_8 = UsersSnack.create!(user_id: @user_2.id, snack_id: @snack_1.id)

    @review_1 = @users_snack_1.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw', rating: 4.6)
    @review_2 = @users_snack_2.reviews.create!(description: 'Out of this world.', rating: 4.7)
    @review_3 = @users_snack_3.reviews.create!(description: 'The only way I can think to save the bees.', rating: 4.8)
    @review_4 = @users_snack_4.reviews.create!(description: 'Best paired with a Mountain Dew.', rating: 4.9)
    @review_5 = @users_snack_5.reviews.create!(description: 'Again, the one with the cheetah.', rating: 5.0)
    @review_6 = @users_snack_6.reviews.create!(description: 'Again, the one with the cheetah.', rating: 1.0)
    @review_7 = @users_snack_7.reviews.create!(description: 'Again, the one with the cheetah.', rating: 0.5)
    @review_8 = @users_snack_8.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw', rating: 5.0)
    end

  describe '#create' do
    it 'creates a snack' do
      snack_payload = {
        name: 'Doritos',
        description: 'BOLD',
        savory: true,
        sweet: false
      }

      expect(Snack.all.count).to eq(7)

      post '/api/v1/snacks', params: snack_payload, as: :json

      expect(response).to be_successful
      expect(Snack.all.count).to eq(8)

      created_snack = JSON.parse(response.body, symbolize_names: true)

      expect(created_snack[:data][:attributes][:name]).to eq(snack_payload[:name])
      expect(created_snack[:data][:attributes][:description]).to eq(snack_payload[:description])
      expect(created_snack[:data][:attributes][:savory]).to eq(snack_payload[:savory])
      expect(created_snack[:data][:attributes][:sweet]).to eq(snack_payload[:sweet])
      expect(created_snack[:data][:attributes][:rating]).to eq(snack_payload[:rating])
    end

    it 'returns errors if snack cannot be created' do
      snack_payload = {
        name: 'Doritos',
        savory: true
      }

      post '/api/v1/snacks', params: snack_payload, as: :json

      expect(response).to_not be_successful

      errors = JSON.parse(response.body, symbolize_names: true)

      expect(errors[:data][:attributes][:errors]).to eq(["Description can't be blank", "Sweet is not included in the list"])
    end
  end

  describe 'update' do
    it 'updates a given snacks attributes' do
      snack_payload = {
        name: 'Doritos'
      }

      expect(@snack_1.name).to_not eq('Doritos')

      patch "/api/v1/snacks/#{@snack_1.id}", params: snack_payload, as: :json

      expect(response).to be_successful

      updated_snack = JSON.parse(response.body, symbolize_names: true)

      expect(updated_snack[:data][:attributes][:updates][:name]).to eq(snack_payload[:name])
    end

    it 'returns an error if no snack found' do
      snack_payload = {
        name: 'Doritos'
      }

      patch "/api/v1/snacks/1232341", params: snack_payload, as: :json

      expect(response).to_not be_successful

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:data][:attributes][:message]).to eq('Snack not found for given id.')
    end
  end

  describe '#destroy' do
    it 'deletes a given snack' do
      delete "/api/v1/snacks/#{@snack_1.id}"

      expect(response).to be_successful

      deleted_response = JSON.parse(response.body, symbolize_names: true)

      expect(deleted_response[:data][:attributes][:message]).to eq('Snack successfully deleted.')
    end

    it 'returns an error if snack is not found' do
      delete '/api/v1/snacks/123434123'

      expect(response).to_not be_successful

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:data][:attributes][:message]).to eq('Snack not found for given id.')
    end
  end

  describe '#index' do
    it 'returns all snacks' do
      get '/api/v1/snacks'

      expect(response).to be_successful

      snacks = JSON.parse(response.body, symbolize_names: true)

      expect(snacks[:data][:attributes][:snacks][0][:name]).to eq('Funyuns')
    end
  end

  describe '#show' do
    it 'returns a single snack' do
      get "/api/v1/snacks/#{@snack_1.id}"

      expect(response).to be_successful

      snack = JSON.parse(response.body, symbolize_names: true)

      expect(snack[:data][:attributes][:name]).to eq(@snack_1.name)
    end

    it 'returns an error if snack does not exist' do
      get '/api/v1/snacks/12134141'

      expect(response).to_not be_successful

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:data][:attributes][:message]).to eq('Snack not found for given id.')
    end
  end

  describe '#average_rating' do
    it 'returns the average rating of a given snack' do
      get "/api/v1/snacks/#{@snack_1.id}/average_rating"

      expect(response).to be_successful

      average_rating = JSON.parse(response.body, symbolize_names: true)

      expect(average_rating[:data][:attributes][:average_rating]).to eq(4.8)
    end
  end

  describe '#top_rated-snacks_overall' do
    it 'returns the top rated snacks with a default limit of 5' do
      get '/api/v1/snacks/top_rated_snacks_overall'

      expect(response).to be_successful

      snacks = [@snack_1, @snack_2, @snack_3, @snack_4, @snack_5]

      top_rated = JSON.prase(response.body, symbolize_names: true)

      expect(top_rated[:data][:attributes][:top_rated_snacks].count).to eq(5)
      expect(top_rated[:data][:attributes][:top_rated_snacks]).to eq(snacks)
    end
  end
end
