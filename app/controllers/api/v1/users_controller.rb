class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_attributes)

    if user.save
      render json: UserSerializer.new_user(user)
    else
      render json: UserSerializer.new_user_errors(user), status: 409
    end
  end

  private
  def user_attributes
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
