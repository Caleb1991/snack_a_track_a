require 'rails_helper'

RSpec.describe Review do
  describe 'validations' do
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:rating)}
    it {should validate_presence_of(:users_snack_id)}
  end

  describe 'relationships' do
    it {should belong_to(:users_snack)}
    it {should have_many(:users).through(:users_snack)}
    it {should have_many(:snacks).through(:users_snack)}
  end
end
