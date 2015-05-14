# Users
User.create!(username:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(username:  "Ivana",
             email: "i@van.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: name,
              email: email,
              password:              password,
              password_confirmation: password,
              admin: false,
              activated: true,
              activated_at: Time.zone.now)
end

cuisine_array = ['African', 'American', 'British', 'Carribean', 'Chinese', 'European', 'French', 'Greek',
                  'Indian', 'Japanese', 'Korean', 'Irish', 'Italian', 'Mexican']
region_array = ['North America', 'Central America', 'South America', 'Carribean', 'West Europe',
                  'Africa', 'East Europe', 'Middle East', 'South Asia', 'East Asia', 'Southeast Asia',
                  'Australia']

# Tables
(1..100).each do |n|

  offset = rand(User.count)

  title = Faker::Lorem.sentence(4)
  cuisine = cuisine_array.sample
  region = region_array.sample
  rand_record = User.offset(offset).first
  Table.create!(title: title,
                cuisine: cuisine,
                region: region,
                user: rand_record)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[2..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }