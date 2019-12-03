class Api::V1::LocationsController < Api::V1::BaseController

  def create
    @location = Location.new(location_params)
    if @location.save
    else
      render_error
  end

  private

  def location_params
    params.require(:location).permit (:address, :longitude, :latitude)
  end

  def render_error
    render json: { errors: @location.errors.full_messages },
           status: :unprocessable_entity
  end
end
