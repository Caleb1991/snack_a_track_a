require 'rails_helper'

RSpec.describe Snack do
  before :each do
    @user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
    @user_2 = User.create!(username: 'Larry1122', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')

    @snack_1 = Snack.create!(name: 'Funyuns', description: 'Oniony', savory: true, sweet: false)
    @snack_2 = Snack.create!(name: 'Star Crunch', description: 'Made with nougat..... I think?', savory: false, sweet: true)
    @snack_3 = Snack.create!(name: 'Honey Bun', description: 'Honey and Bun-y', savory: false, sweet: true)
    @snack_4 = Snack.create!(name: 'Doritos', description: 'Bold', savory: true, sweet: false)
    @snack_5 = Snack.create!(name: 'Cheetos', description: 'The one with the cheetah', savory: true, sweet: false)

    @users_snack_1 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_1.id)
    @users_snack_2 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_2.id)
    @users_snack_3 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_3.id)
    @users_snack_4 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_4.id)
    @users_snack_5 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_5.id)
    @users_snack_6 = UsersSnack.create!(user_id: @user_2.id, snack_id: @snack_5.id)
    @users_snack_7 = UsersSnack.create!(user_id: @user_2.id, snack_id: @snack_1.id)

    @review_1 = @users_snack_1.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw', rating: 4.6)
    @review_2 = @users_snack_2.reviews.create!(description: 'Out of this world.', rating: 4.7)
    @review_3 = @users_snack_3.reviews.create!(description: 'The only way I can think to save the bees', rating: 4.8)
    @review_4 = @users_snack_4.reviews.create!(description: 'Best paired with a Mountain Dew', rating: 4.9)
    @review_5 = @users_snack_5.reviews.create!(description: 'Again, the one with the cheetah', rating: 5.0)
    @review_6 = @users_snack_6.reviews.create!(description: 'They werent that hot', rating: 1.0)
    @review_7 = @users_snack_7.reviews.create!(description: 'They werent that hot', rating: 5.0)
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
  end

  describe 'relationships' do
    it {should have_many(:users_snacks)}
    it {should have_many(:users).through(:users_snacks)}
    it {should have_many(:reviews).through(:users_snacks)}
  end

  describe '#average_rating' do
    it 'returns the average rating based on all reviews for a given snack' do
      expect(@snack_1.average_rating).to eq(4.8)
    end
  end

  describe '#users_top_rated_snacks' do
    it 'returns a users top rated snacks in descending order, default limit of 5' do
      snacks = [@snack_5, @snack_4, @snack_3, @snack_2, @snack_1]

      expect(Snack.users_top_rated_snacks(@user_1)).to eq(snacks)
    end
  end

  describe '#top_rated_snacks_overall' do
    it 'returns the top rated snacks in descending order with default limit of five' do
      snacks = [@snack_5, @snack_4, @snack_1, @snack_3, @snack_2]

      expect(Snack.top_rated_snacks_overall).to eq(snacks)
    end
  end
end
