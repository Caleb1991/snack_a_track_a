class UsersSnack < ApplicationRecord
  validates_presence_of :user_id, :snack_id
  belongs_to :user
  belongs_to :snack
  has_many :reviews
end
