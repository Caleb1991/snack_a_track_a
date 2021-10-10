class Api::V1::UsersSnacksController < ApplicationController
  def create
    users_snack = UsersSnack.create(users_snack_parameters)

    if users_snack.save
      render json: UsersSnackSerializer.new_users_snack(users_snack)
    else
      render json: UsersSnackSerializer.creation_error(users_snack), status: 409
    end
  end

  def destroy
    begin
      users_snack = UsersSnack.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render json: UsersSnackSerializer.users_snack_not_found, status: 400
    end

    users_snack.delete
    render json: UsersSnackSerializer.succesfully_deleted
  end

  private
  def users_snack_parameters
    JSON.parse(request.body.read, symbolize_names:true)
  end
end
