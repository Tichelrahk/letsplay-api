json.events do
  json.array! @events do |event|
    json.extract! event, :id, :name, :description, :image, :location, :user
    json.date event.start.strftime("%A, %b %d")
    json.start event.start.strftime("%A, %b %-l:%M%p")
    json.end event.end.strftime("%A, %b %-l:%M%p")
  end
end
