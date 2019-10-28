5.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  number = "08011111111"
  User.create!(name: name,
               email: email,
               password: password,
               number: number,
               admin: "true"
               )
end

10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  number = "08011111111"
  User.create!(name: name,
               email: email,
               password: password,
               number: number,
               admin: "false"
               )
end

10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  number = "08011111111"
  User.create!(name: name,
               email: email,
               password: password,
               number: number,
               admin: "false"
               )
end
