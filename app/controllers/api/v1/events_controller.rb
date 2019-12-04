class Api::V1::EventsController < Api::V1::BaseController
  before_action :set_event, only:[:show]

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
    if @event.save
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
    params.require(:event).permit(:name, :start, :end, :descrption)
  end

  def render_error
    render json:{ errors: @event.errors.full},
      status: :unprocessable_entity
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
