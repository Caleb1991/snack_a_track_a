class User < ApplicationRecord
  validates_presence_of :username, uniqueness: true
  validates_presence_of :first_name, :last_name, :email, :password_digest
  has_secure_password
end
