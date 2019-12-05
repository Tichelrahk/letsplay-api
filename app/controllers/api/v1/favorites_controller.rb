class Api::V1::FavoritesController < Api::V1::BaseController


  def create
    @user = User.find(params[user_id])
    @event = Event.find(params[event_id])
    @user.favorite(@event)
  end

  def destroy
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @user.unfavorite(@event)
  end

end
