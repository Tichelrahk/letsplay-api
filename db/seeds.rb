# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
arr_events = [
              { name: 'Yoga Time', start: DateTime.parse('2019-12-08 15:00:00'), end: DateTime.parse('2019-12-08 16:00:00'), description: 'Come stretch with us.', image: 'http://lc-dnc55p3h.cn-e1.lcfile.com/4545b589def4381b78a9'},
              { name: 'Football fun', start: DateTime.parse('2019-12-08 10:30:00'), end: DateTime.parse('2019-12-08 16:00:00'), description: 'I am organizing a kick-around with some friends and could always use some more players', image: 'http://lc-dnc55p3h.cn-e1.lcfile.com/c32ac674db34f5b4eec2'},
              { name: 'Walk the Bund', start: DateTime.parse('2019-12-08 13:00:00'), end: DateTime.parse('2019-12-08 15:00:00'), description: 'I would like to take a walk with someone and see the skyline of Shanghai', image: 'http://lc-dnc55p3h.cn-e1.lcfile.com/e6cbf6aecd27b29ae97d' },
              { name: 'Ultimate Frisbee', start: DateTime.parse('2019-12-08 14:00:00'), end: DateTime.parse('2019-12-08 17:00:00'), description: 'Play some ultimate! Get some exercise! Make some friends!', image: 'http://lc-dnc55p3h.cn-e1.lcfile.com/a2f10603fad8429f5205'},
              { name: 'Woman Doubles Tennis player needed', start: DateTime.parse('2019-12-08 10:00:00'), end: DateTime.parse('2019-12-08 12:00:00'), description: 'We are three ladies who are very enthusiastic about tennis. Looking for 1 more who can play regularly', image: 'http://lc-dnc55p3h.cn-e1.lcfile.com/e236e6628fa46331ad36'},
              { name: 'Rugby Bonanza', start: DateTime.parse('2019-12-08 10:00:00'), end: DateTime.parse('2019-12-08 16:00:00'), description: 'We are setting up a for fun tournament, we will sort you into teams by skill level. All levels welcome', image: 'http://lc-dnc55p3h.cn-e1.lcfile.com/431b5191ba2da9fb942b' },
              { name: 'Ballers night', start: DateTime.parse('2019-12-10 18:00:00'), end: DateTime.parse('2019-12-10 20:00:00'), description: 'We are a group of people who like to shoot b-ball outside the school', image: 'http://lc-dnc55p3h.cn-e1.lcfile.com/43b6bad7e8633f465079' },
              { name: 'Cycle Shanghai', start: DateTime.parse('2019-12-07 08:00:00'), end: DateTime.parse('2019-12-07 14:00:00'), description: 'We need an experienced rider who can fill in for an injury on our team.', image: 'http://lc-dnc55p3h.cn-e1.lcfile.com/e8ffaea1e33a475ef343' },
              { name: 'Dancing is love', start: DateTime.parse('2019-12-09 20:00:00'), end: DateTime.parse('2019-12-09 22:00:00'), description: 'Swing dancing fun. All levels welcome', image: 'lc-dnc55p3h.cn-e1.lcfile.com/e9042ba48ba271e8d0f7' },
             ]
Confirmation.destroy_all
Event.destroy_all
User.destroy_all

arr_users = [{name: 'Janice Jeffery', profile_picture: 'http://lc-dnc55p3h.cn-e1.lcfile.com/2928f03563d42d52f9b2', bio: 'Living the dream in Shanghai!' },
             {name: 'Dewey Powell', profile_picture: 'http://lc-dnc55p3h.cn-e1.lcfile.com/41832acc33d36b276d38', bio: 'Stay active, stay healthy' },
             {name: 'Katherine Browning', profile_picture: 'http://lc-dnc55p3h.cn-e1.lcfile.com/6c5d854a21de0c160d6b', bio: "I'm all about that healthy lifestyle. Let's make the world a happier, healthier place"},
             {name: 'Jason Clayton', profile_picture: 'http://lc-dnc55p3h.cn-e1.lcfile.com/2d014adf206980eb80c5', bio: ''},
             {name: 'Stephen Hsu', profile_picture: 'http://lc-dnc55p3h.cn-e1.lcfile.com/ecbac72c1c351f9d0ad6', bio: 'I live, dream and eat fitness every day of my life'}
            ]
arr_locations = [ {address: '上海市杨浦区', longitude: 121.55113914886473, latitude: 31.320136029602022},
                  {address: '上海市静安区华山路189号', longitude: 121.44715526977538, latitude: 31.222052023696875},
                  {address: '上海市静安区淮安路717号', longitude: 121.45118, latitude: 31.23972 },
                  {address: '上海市浦东新区冬融路272号', longitude: 121.58864715972899, latitude: 31.3329300436515},
                  {address: '上海市静安区陕西北路500号', longitude: 121.4532277909851, latitude: 31.23155676613047},
                  {address: '上海市静安区北京西路1399号', longitude: 121.448528560791 , latitude: 31.22763021235735 },
                  {address: '上海市普陀区长寿路401号', longitude: 121.43755 , latitude: 31.239228 },
                  {address: '上海市静安区陕西南路122-8号', longitude: 121.45706871429442 , latitude: 31.220877626239613 },
                  {address: '上海市黄浦区瑞金二路67号', longitude: 121.46440723815917 , latitude: 31.217537853729194 }
                ]

# u = User.new(name: 'Etienne', profile_picture: 'https://images.unsplash.com/photo-1565201228718-1ade51bb7138?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80', bio: "Let's play sports!")
# u.save!

# l = Location.new(address: 'Shanghai', latitude: 31.22, longitude: 121.00)
# l.save!

arr_events.each_with_index do |event, i|
  e = Event.new(event)
  u = User.new(arr_users.sample)
  l = Location.new(arr_locations[i])
  e.user = u
  e.location = l
  e.save!
end

puts "Saved #{Event.all.length}"
