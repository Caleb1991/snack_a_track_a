class Api::V1::SnacksController < ApplicationController
  def create
    snack = Snack.create(snack_attributes)

    if snack.save
      render json: SnackSerializer.new_snack(snack)
    else
      render json: SnackSerializer.creation_error(snack), status: 409
    end
  end

  def update
    begin
      snack = Snack.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render json: SnackSerializer.snack_not_found, status: 400
    end

    snack.update(snack_attributes)
    render json: SnackSerializer.updates_to_snack(snack_attributes, snack.id)
  end

  def destroy
    begin
      snack = Snack.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render json: SnackSerializer.snack_not_found, status: 400
    end

    snack.delete
    render json: SnackSerializer.deleted_snack
  end

  private
  def snack_attributes
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
