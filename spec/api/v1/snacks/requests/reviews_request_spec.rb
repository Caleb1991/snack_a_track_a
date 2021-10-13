require 'rails_helper'

RSpec.describe 'snacks Reviews API' do
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
    @snack_8 = Snack.create!(name: 'Sun Chips', description: 'Sunny', savory: true, sweet: false)
    @snack_9 = Snack.create!(name: 'Popcorn', description: 'Poppable', savory: true, sweet: false)

    @users_snack_1 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_1.id)
    @users_snack_2 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_2.id)
    @users_snack_3 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_3.id)
    @users_snack_4 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_4.id)
    @users_snack_5 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_5.id)
    @users_snack_6 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_6.id)
    @users_snack_7 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_7.id)
    @users_snack_8 = UsersSnack.create!(user_id: @user_2.id, snack_id: @snack_1.id)
    @users_snack_9 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_8.id)
    @users_snack_10 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_9.id)

    @review_1 = @users_snack_1.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw', rating: 4.6)
    @review_2 = @users_snack_2.reviews.create!(description: 'Out of this world.', rating: 4.7)
    @review_3 = @users_snack_3.reviews.create!(description: 'The only way I can think to save the bees.', rating: 4.8)
    @review_4 = @users_snack_4.reviews.create!(description: 'Best paired with a Mountain Dew.', rating: 4.9)
    @review_5 = @users_snack_5.reviews.create!(description: 'Again, the one with the cheetah.', rating: 5.0)
    @review_6 = @users_snack_6.reviews.create!(description: 'Again, the one with the cheetah.', rating: 1.0)
    @review_7 = @users_snack_7.reviews.create!(description: 'Again, the one with the cheetah.', rating: 0.5)
    @review_8 = @users_snack_8.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw', rating: 1.0)
    @review_9 = @users_snack_9.reviews.create!(description: 'Radical', rating: 0.9)
    @review_10 = @users_snack_10.reviews.create!(description: 'Amazing', rating: 0.8)
  end

  describe '#index' do
    it 'returns all of a given snacks reviews' do
      get "/api/v1/snacks/#{@snack_1.id}/reviews"

      expect(response).to be_successful

      reviews = JSON.parse(response.body, symbolize_names: true)

      expect(reviews[:data][:attributes][:reviews].count).to eq(2)
      expect(reviews[:data][:attributes][:reviews][0][:rating]).to eq(4.6)
    end
  end
end
