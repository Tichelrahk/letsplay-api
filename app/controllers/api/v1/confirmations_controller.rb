class Api::V1::ConfirmationsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @confirmation = Confirmation.new
    @confirmation.status = "applying"
    @confirmation.event = @event
    @confirmation.user = @user
    if @confirmation.save
      # render :show
      render json: {
        msg: "Joined"
      }
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

  def destroy
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])

    @confirmation = Confirmation.find_by(user: @user, event: @event)
    @confirmation.destroy
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
