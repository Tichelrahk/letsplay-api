json.events do
  json.array! @events do |event|
    json.extract! event, :id, :name, :start, :end, :descrption
  end
end
