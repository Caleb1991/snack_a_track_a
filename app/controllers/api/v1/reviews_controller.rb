class Api::V1::ReviewsController < ApplicationController
  def create
    review = Review.create(review_attributes)

    if review.save
      render json: ReviewSerializer.new_review(review)
    else
      render json: ReviewSerializer.creation_error(review), status: 409
    end
  end

  private
  def review_attributes
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
