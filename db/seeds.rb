1.times do |n|
  name = "admin"
  email = "admin@email.com"
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
  User.create!(name: "user#{n}",
               email: "user#{n}@email.com",
               password: "password#{n}",
               number: 12345678976,
               admin: "false"
               )
end
