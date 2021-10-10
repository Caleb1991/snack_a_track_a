class Api::V1::SnacksController < ApplicationController
  def create
    snack = Snack.create(snack_attributes)

    if snack.save
      render json: SnackSerializer.new_snack(snack)
    else
      render json: SnackSerializer.creation_error(snack), status: 409
    end
  end

  private
  def snack_attributes
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
