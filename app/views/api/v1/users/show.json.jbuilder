json.user do
  json.id @user.id
  json.description @user.bio
  json.name @user.name
  json.location @user.location
  json.profile_picture @user.profile_picture
  if @confirmations
    json.confirmations @confirmations do |confirmation|
      json.confirmation confirmation
      json.status confirmation.status
      json.event confirmation.event
      json.user confirmation.event.user
      json.date confirmation.event.start.strftime("%A, %b %d")
      json.start confirmation.event.start.strftime("%-l:%M%p")
      json.end confirmation.event.end.strftime("%-l:%M%p")
    end
  end

  json.events @events do |event|
    json.extract! event, :id, :name, :description, :image
    json.date event.start.strftime("%A, %b %d")
    json.start event.start.strftime("%-l:%M%p")
    json.end event.end.strftime("%-l:%M%p")
  end
end

# if @events
#   json.event @events do |event|
#     json.id event.id
#     json.description event.description
#     json.name event.name
#     @events.confirmations
#     json.confirmations @events.confirmations do |confirmation|
#       json.confirmation confirmation
#       json.user confirmation.user
#       json.event confirmation.event
#     end
#   end
# end
