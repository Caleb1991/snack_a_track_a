class Snack < ApplicationRecord
  validates_presence_of :name, :description, :rating
  validates :savory, :sweet, inclusion: [true, false]
  has_many :users_snack, dependent: :destroy 
  has_many :users, through: :users_snack
end
