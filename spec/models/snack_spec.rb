require 'rails_helper'

RSpec.describe Snack do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:rating)}
  end

  describe 'relationships' do
    it {should have_many(:users_snack)}
    it {should have_many(:users).through(:users_snack)}
  end
end