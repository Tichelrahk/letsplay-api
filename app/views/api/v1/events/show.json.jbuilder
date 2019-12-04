# json.extract! @event, :id, :name, :start, :end, :descrption

if @event
  json.event do
    json.id @event.id
    json.description @event.description
    json.name @event.name
    json.start @event.start
    json.end @event.end
    json.image @event.image
    json.organizer @event.user
    json.confirmations @event.confirmations do |confirmation|
      json.confirmation confirmation
      json.user confirmation.user
    end
  end
end


