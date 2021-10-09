class Snack < ApplicationRecord
  validates_presence_of :name, :description, :savory, :sweet, :rating
  has_many :users_snack
  has_many :users, through: :users_snack
end
