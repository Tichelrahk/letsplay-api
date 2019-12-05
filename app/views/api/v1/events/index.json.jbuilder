json.events do
  json.array! @events do |event|
    json.extract! event, :id, :name, :description, :image, :location, :user
    json.date event.start.strftime("%A, %b %d")
    json.start event.start.strftime("%-l:%M%p")
    json.end event.end.strftime("%-l:%M%p")
  end
end
