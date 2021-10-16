require './lib/snack_recommendation.rb'

class User < ApplicationRecord
  include SnackRecommendation
  validates :username, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name, :email, :password_digest
  has_many :users_snacks, dependent: :destroy
  has_many :snacks, through: :users_snacks
  has_many :reviews, through: :users_snacks
  has_secure_password
end
