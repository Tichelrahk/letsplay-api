class Api::V1::ConfirmationsController < Api::V1::BaseController

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @confirmation = Confirmation.new
    @confirmation.status = "applying"
    @confirmation.event = @event
    @confirmation.user = @user
    if @confirmation.save
      render :show
    else
      render_error
    end
  end

  def update
    if @confirmation.update(confirmation_params)
    else
      render_error
    end
  end

  private

  def confirmation_params
    params.require(:confirmation).permit(:status, :not_attended)
  end

  def render_error
    render json:{ errors: @confirmation.errors.full},
      status: :unprocessable_entity
  end
end
