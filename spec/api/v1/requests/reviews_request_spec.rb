require 'rails_helper'

RSpec.describe 'Reviews API' do
  before :each do
    @user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
    @snack_1 = Snack.create!(name: 'Funyuns', description: 'DELICIOUS', savory: true, sweet: false)
    @snack_2 = Snack.create!(name: 'Star Crunch', description: 'AMAZING', savory: false, sweet: true)
    @users_snack_1 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_1.id)
    @users_snack_2 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_2.id)
    @review_1 = @users_snack_1.reviews.create!(description: 'What a fun and exciting snack', rating: 4.5)
  end

  describe '#create' do
    it 'creates a review for a given users_snack' do
      review_payload = {
        description: 'Out of this world',
        rating: 3.3,
        users_snack_id: @users_snack_2
      }

      post '/api/v1/reviews', params: review_payload, as: :json

      expect(response).to be_successful

      new_review = JSON.parse(response.body, symbolize_names: true)

      expect(new_review[:data][:attributes][:description]).to eq(review_payload[:description])
      expect(new_review[:data][:attributes][:rating]).to eq(review_payload[:rating])
    end

    it 'returns an error if it is missing data' do
      review_payload = {
        rating: 3.3
      }

      post '/api/v1/reviews', params: review_payload, as: :json

      expect(response).to_not be_successful

      errors = JSON.parse(response.body, symbolize_names: true)

      expect(errors[:data][:attributes][:errors]).to eq('must include description.')
    end
  end
end
