class Api::V1::EventsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_event, only: [:show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query"
      @events = Event.where(sql_query, query: "%#{params[:query]}%")
    else
      @events = Event.all
    end
    # render json: @events
  end

  def show
  end

  def create
    @event = Event.new(event_params)
    @user = User.find(params[:user_id])
    @location = Location.new(location_params)
    @location.save!
    @event.user = @user
    @event.location = @location
    if @event.save!
      render :show
    else
      render_error
    end
  end

  def update
    if @event.update(event_params)
      render :show
    else
      render_error
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start, :end, :description, :image)
  end

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

  def render_error
    render json:{ errors: @event.errors.full},
      status: :unprocessable_entity
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
