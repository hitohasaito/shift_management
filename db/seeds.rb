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

30.times do |n|

  from = Time.parse("2019/11/01")
  to = Time.parse("2019/11/31")
  date = Random.rand(from..to)

  from = Time.parse("9:00:00")
  to = Time.parse("13:00:00")
  start_time = Random.rand(from..to)

  from = Time.parse("13:30:00")
  to = Time.parse("22:00:00")
  end_time = Random.rand(from..to)

  job = "受付"

  Shift.create!(duty_on: date,
                started_at: time,
                end_at: end_time,
                job: job,
                status: 1
               )
end

30.times do |n|

  from = Time.parse("2019/11/01")
  to = Time.parse("2019/11/31")
  date = Random.rand(from..to)

  from = Time.parse("9:00:00")
  to = Time.parse("13:00:00")
  start_time = Random.rand(from..to)

  from = Time.parse("13:30:00")
  to = Time.parse("23:00:00")
  end_time = Random.rand(from..to)

  job = "自習室"

  Shift.create!(duty_on: date,
                started_at: time,
                end_at: time,
                job: job,
                status: 1
               )
end
