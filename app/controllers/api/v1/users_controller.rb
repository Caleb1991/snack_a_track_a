class Api::V1::UsersController < ApplicationController

  def index
    render json: UserSerializer.all_users(User.all)
  end
  
  def create
    user = User.create(user_attributes)

    if user.save
      render json: UserSerializer.new_user(user)
    else
      render json: UserSerializer.new_user_errors(user), status: 409
    end
  end

  def update
    begin
      user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render json: UserSerializer.no_user_found, status: 404
    end

    user.update(user_attributes)
    render json: UserSerializer.updated_user(user_attributes, user.id)
  end

  def destroy
    begin
      user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render json: UserSerializer.no_user_found, status: 404
    end

    user.delete
    render json: UserSerializer.deleted_user
  end

  private
  def user_attributes
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
