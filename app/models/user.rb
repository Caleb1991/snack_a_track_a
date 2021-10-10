class User < ApplicationRecord
  validates_presence_of :username, uniqueness: true
  validates_presence_of :first_name, :last_name, :email, :password_digest
  has_many :users_snack, dependent: :destroy
  has_many :snacks, through: :users_snack
  has_many :reviews, through: :users_snack
  has_secure_password
end
