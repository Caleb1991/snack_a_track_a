class Api::V1::Snacks::ReviewsController < ApplicationController
  def index
    begin
      snack = Snack.find(params[:snack_id])
    rescue ActiveRecord::RecordNotFound
      return render json: SnackSerializer.snack_not_found, status: 404
    end

    render json: ReviewSerializer.all_reviews_for_snack(snack)
  end
end
