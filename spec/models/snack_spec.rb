require 'rails_helper'

RSpec.describe Snack do
  before :each do
    @user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
    @user_2 = User.create!(username: 'Larry2020', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRules91@Gmail.Com', password: 'PolarBearsRule11', password_confirmation: 'PolarBearsRule11')

    @snack_1 = Snack.create!(name: 'Funyuns', description: 'Oniony', savory: true, sweet: false)

    @users_snack_1 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_1.id)
    @users_snack_2 = UsersSnack.create!(user_id: @user_2.id, snack_id: @snack_1.id)

    @review_1 = @users_snack_1.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw.', rating: 4.6)
    @review_2 = @users_snack_2.reviews.create!(description: 'TASTY!', rating: 5.0)
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
  end

  describe 'relationships' do
    it {should have_many(:users_snack)}
    it {should have_many(:users).through(:users_snack)}
    it {should have_many(:reviews).through(:users_snack)}
  end

  describe '#average_rating' do
    it 'returns the average rating based on all reviews for a given snack' do
      expect(@snack_1.average_rating).to eq(4.8)
    end
  end
end
