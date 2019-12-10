json.events do
  json.array! @events do |event|
    json.extract! event, :id, :name, :description, :image, :location, :user, :slots
    json.tags event.tag_list
    json.date event.start.strftime("%A, %b %d")
    json.start event.start.strftime("%-l:%M%p")
    json.end event.end.strftime("%-l:%M%p")
    json.attendees event.confirmations.length + 1
  end
end
