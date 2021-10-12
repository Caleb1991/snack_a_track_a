class Api::V1::SnacksController < ApplicationController
  def index
    render json: SnackSerializer.all_snacks(Snack.all)
  end

  def show
    begin
      snack = Snack.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render json: SnackSerializer.snack_not_found, status: 400
    end

    render json: SnackSerializer.single_snack(snack)
  end

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

    snack.destroy
    render json: SnackSerializer.deleted_snack
  end

  def average_rating
    begin
      snack = Snack.find(params[:snack_id])
    rescue ActiveRecord::RecordNotFound
      return render json: SnackSerializer.snack_not_found, status: 400
    end

    render json: SnackSerializer.average_rating(snack.average_rating, snack.id)
  end

  def top_rated_snacks_overall
    if params.include?(:limit)
      render json: SnackSerializer.top_snacks(Snack.top_rated_snacks_overall(params[:limit]))
    else
      render json: SnackSerializer.top_snacks(Snack.top_rated_snacks_overall)
    end
  end

  def top_rated_savory_or_sweet_snacks
    if params.include?(:limit)
      render json: SnackSerializer.top_savory_or_sweet(Snack.top_rated_savory_or_sweet_snacks(params[:taste], params[:limit]))
    else
      render json: SnackSerializer.top_savory_or_sweet(Snack.top_rated_savory_or_sweet_snacks(params[:taste]))
    end
  end

  private
  def snack_attributes
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
