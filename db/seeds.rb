# Users
User.create!(username:  "Example User",
             email: "example@railstutorial.org",
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