require 'rails_helper'

RSpec.describe UsersSnack do
  describe 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:snack_id)}
  end

  describe 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:snack)}
    it {should have_many(:reviews)}
  end
end
