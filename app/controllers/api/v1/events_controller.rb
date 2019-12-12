class Api::V1::EventsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_event, only: [:show]

  def index
    if params[:query].present?
      sql_query = "events.name ILIKE :query \
      OR tags.name ILIKE :query \
      OR locations.address ILIKE :query"
      @events = Event.joins(:location).joins(:tags).where(sql_query, query: "%#{params[:query]}%").order('updated_at DESC').distinct.select { |e| e.private != true }
    else
      @events = Event.order('updated_at DESC').select { |e| e.private != true }
    end
    # render json: @events
  end

  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    end
    @full = ((@event.confirmations.length + 1) >= @event.slots) if @event.slots
  end

  def create
    @event = Event.new(event_params)
    @user = User.find(params[:user_id])
    @location = Location.new(location_params)
    @location.save!
    @event.user = @user
    @event.location = @location
    if @event.save!
      render json: {
        event: @event.id
      }
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

  def acts_as_favoritable
    @event.favoritors
  end

  def update_tags
    @event = Event.find(params[:id])
    @event.tag_list = tag_params
    @event.save!
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :start, :end, :description, :image, :slots, :private, tag_list: [])
  end

  def tag_params
    params.require(:event).permit(tag_list: [])
  end

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

  def render_error
    render json: { errors: @event.errors.full } ,
      status: :unprocessable_entity
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
