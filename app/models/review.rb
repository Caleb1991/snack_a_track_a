class Review < ApplicationRecord
  validates_presence_of :description, :users_snack_id
  validates_presence_of :rating, numericality: true
  belongs_to :users_snack
  has_many :snacks, through: :users_snack
  has_many :users, through: :users_snack
end
