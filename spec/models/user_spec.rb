require 'rails_helper'

RSpec.describe User do
  describe '#validations' do
    it {validates_presence_of(:username)}
    it {validates_presence_of(:first_name)}
    it {validates_presence_of(:last_name)}
    it {validates_presence_of(:email)}
    it {validates_presence_of(:password)}
  end
end
