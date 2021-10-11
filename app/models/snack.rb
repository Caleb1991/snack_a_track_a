class Snack < ApplicationRecord
  validates_presence_of :name, :description
  validates :savory, :sweet, inclusion: [true, false]
  has_many :users_snacks, dependent: :destroy
  has_many :users, through: :users_snacks
  has_many :reviews, through: :users_snacks, dependent: :destroy

  def average_rating
    reviews.average(:rating).to_f
  end

  def self.users_top_five_rated_snacks(user)
    joins(:reviews)
    .where('user_id = ?', user.id)
    .order(rating: :desc)
  end
end
