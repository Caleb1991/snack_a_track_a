require 'rails_helper'

RSpec.describe 'Snack API' do
  before :each do
    @snack = Snack.create!(name: 'Funyuns', description: 'DELICIOUS', savory: true, sweet: false, rating: 4.5)
  end

  describe '#create' do
    it 'creates a snack' do
      snack_payload = {
        name: 'Doritos',
        description: 'BOLD',
        savory: true,
        sweet: false,
        rating: 2.5
      }

      expect(Snack.all.count).to eq(1)

      post '/api/v1/snacks', params: snack_payload, as: :json

      expect(response).to be_successful

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
        savory: true,
        rating: 2.5
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

      expect(@snack.name).to_not eq('Doritos')

      patch "/api/v1/#{@snack.id}", params: snack_payload, as: :json

      expect(response).to be_successful

      updated_snack = JSON.parse(response.body, symbolize_names: true)

      expect(updated_snack[:data][:attributes][:updates][:name]).to eq(snack_payload[:name])
    end

    it 'returns an error if no snack found' do
      snack_payload = {
        name: 'Doritos'
      }

      patch "/api/v1/1232341", params: snack_payload, as: :json

      expect(response).to_not be_successful

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:data][:attributes][:error]).to eq('Snack not found with given id.')
    end
  end
end
