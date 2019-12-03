# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
arr_events = [{ name: 'Ballers night', start: DateTime.parse('2019-12-10 18:00:00'), end: DateTime.parse('2019-12-10 20:00:00'), description: 'We are a group of people who play b-ball outside the school', image: 'https://unsplash.com/photos/ttAhBmEfNIk' },
              { name: 'Walk the Bund', start: DateTime.parse('2019-12-08 12:00:00'), end: DateTime.parse('2019-12-08 15:00:00'), description: 'I would like to take a casual walk with someone and see the skyline of Shanghai', image: 'https://images.unsplash.com/photo-1527909249915-9ff58d10d4c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80' },
              { name: 'Cycle Shanghai', start: DateTime.parse('2019-12-07 08:00:00'), end: DateTime.parse('2019-12-07 14:00:00'), description: 'We need an experienced rider who can fill in for an injury on our team.', image: 'https://images.unsplash.com/photo-1471439330580-1493ebc92c13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1362&q=80' },
              { name: 'Dancing is love', start: DateTime.parse('2019-12-09 20:00:00'), end: DateTime.parse('2019-12-09 22:00:00'), description: 'Salsa dancing fun. All levels welcome', image: 'https://images.unsplash.com/photo-1545959570-a94084071b5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1287&q=80' },
              { name: 'Soccer Bonanza', start: DateTime.parse('2019-12-08 10:00:00'), end: DateTime.parse('2019-12-08 16:00:00'), description: 'We are setting up a for fun tournament, we will sort you into teams by skill level. All levels welcome', image: 'https://images.unsplash.com/photo-1525088068454-ff2c453e50e9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60' }]

Event.destroy_all

u = User.new(name: 'Etienne', profile_picture: 'https://images.unsplash.com/photo-1565201228718-1ade51bb7138?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80', bio: "Let's play sports!")
u.save!

l = Location.new(address: 'Shanghai', latitude: 31.22, longitude: 121.00)
l.save!

arr_events.each do |event|
  e = Event.new(event)
  e.user = u
  e.location = l
  e.save!
end

puts "Saved #{Event.all.length}"
