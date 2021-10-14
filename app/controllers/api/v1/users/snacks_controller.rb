class Api::V1::Users::SnacksController < ApplicationController
  def index
    begin
      user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      return render json: UserSerializer.no_user_found, status: 404
    end

    render json: SnackSerializer.all_users_snacks(user)
  end

  def users_top_rated_snacks
    begin
      user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      return render json: UserSerializer.no_user_found, status: 404
    end

    if params.include?(:limit)
      render json: SnackSerializer.top_five_user_snacks(Snack.users_top_rated_snacks(user, params[:limit]), user.id)
    else
      render json: SnackSerializer.top_five_user_snacks(Snack.users_top_rated_snacks(user), user.id)
    end
  end

  def snack_recommendations
    begin
      user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      return render json: UserSerializer.no_user_found, status: 404
    end

    render json: UserSerializer.snack_recs(user.id, user.recommend_snacks)
  end
end
