class Snack < ApplicationRecord
  validates_presence_of :name, :description, :savory, :sweet, :rating
end
