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
      json.location confirmation.event.location.address
      json.attendees confirmation.event.confirmations.length + 1
      json.tag_list confirmation.event.tag_list
      json.private confirmation.event.private
    end
  end

  json.events @events do |event|
    json.extract! event, :id, :name, :description, :image, :slots
    json.attendees event.confirmations.length + 1
    json.location event.location.address
    json.date event.start.strftime("%A, %b %d")
    json.start event.start.strftime("%-l:%M%p")
    json.end event.end.strftime("%-l:%M%p")
    json.private event.private
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
