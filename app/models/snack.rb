class Snack < ApplicationRecord
  validates_presence_of :name, :description
  validates :savory, :sweet, inclusion: [true, false]
  has_many :users_snacks, dependent: :destroy
  has_many :users, through: :users_snacks
  has_many :reviews, through: :users_snacks

  def average_rating
    reviews.average(:rating).to_f
  end

  def self.users_top_rated_snacks(user, limit = 5)
    joins(:reviews)
    .where('user_id = ?', user.id)
    .order(rating: :desc)
    .limit(limit)
  end

  def self.top_rated_snacks_overall(limit = 5)
    joins(:reviews)
    .select('snacks.*, AVG(reviews.rating) AS average_rating')
    .group('snacks.id')
    .order(average_rating: :desc)
    .limit(limit)
  end
end
