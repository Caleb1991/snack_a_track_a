class Api::V1::SessionsController < ApplicationController
  def create
    credentials = user_credentials
    user = User.find_by(username: credentials[:username])

    if user && user.authenticate(credentials[:password])
      render json: UserSerializer.successful_login(user), status: 201
    else
      render json: UserSerializer.unsuccessful_login, status: 400
    end
  end

  private
  def user_credentials
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
