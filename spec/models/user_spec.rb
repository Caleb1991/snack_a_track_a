require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
  end

  describe 'relationships' do
    it {should have_many(:users_snack)}
    it {should have_many(:snacks).through(:users_snack)}
  end
end
