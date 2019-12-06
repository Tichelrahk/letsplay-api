class Api::V1::FavoritesController < Api::V1::BaseController
skip_before_action :verify_authenticity_token

  def create
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])

    if @event.favorited_by?(@user)
      @user.unfavorite(@event)
      data = false
    else
      @user_fav = @user.favorite(@event)
      @user_fav
      data =true
       p "see #{@user_fav}"
    end
    @user.favorited_events.each do |e|
      p e.name
    end
    render json: {
      liked: data
    }
  end

  # def destroy
  #   @user = User.find(params[:user_id])
  #   @event = Event.find(params[:event_id])
  #   @user.unfavorite(@event)
  # end

end
