# json.extract! @event, :id, :name, :start, :end, :descrption

if @event
  json.event do
    json.id @event.id
    json.description @event.description
    json.name @event.name
    json.date @event.start.strftime("%A, %b %d")
    json.start @event.start.strftime("%-l:%M%p")
    json.end @event.end.strftime("%-l:%M%p")
    json.image @event.image
    json.organizer @event.user
    json.location @event.location
    json.confirmations @event.confirmations do |confirmation|
      json.confirmation confirmation
      json.user confirmation.user
    end
  end
end


