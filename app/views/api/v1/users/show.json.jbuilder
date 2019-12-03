json.user do
  json.id @user.id
  json.description @user.description
  json.name @user.name
  json.location @user.location
  json.profile_picture @user.profile_picture
  json.confirmations @confirmations do |confirmation|
    json.confirmation confirmation
    json.event confirmation.event
    json.user confirmation.event.user
  end
end

if @event
  json.event do
    json.id @event.id
    json.description @event.description
    json.name @event.name
    json.confirmations @event.confirmations do |confirmation|
      json.confirmation confirmation
      json.user confirmation.user
      json.event confirmation.event
    end
  end
end
