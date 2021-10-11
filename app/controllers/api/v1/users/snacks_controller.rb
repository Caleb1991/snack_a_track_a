class Api::V1::Users::SnacksController < ApplicationController
  def index
    begin
      user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      return render json: UserSerializer.no_user_found, status: 404
    end

    render json: SnackSerializer.all_users_snacks(user)
  end

  def top_five
    begin
      user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      return render json: UserSerializer.no_user_found, status: 404
    end

    render json: SnackSerializer.top_five_user_snacks(user.top_five, user.id)
  end
end
