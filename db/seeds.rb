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

  from = DateTime.create!(2019, 11 ,01, 10, 00, 45, 0.375)
  to = DateTime.create!(2019, 11 ,01, 15, 00, 45, 0.375)
  start_time = Random.rand(from..to)

  from = DateTime.create!(2019, 11 ,01, 15, 00, 45, 0.375)
  to = DateTime.create!(2019, 11 ,01, 22, 00, 45, 0.375)
  end_time = Random.rand(from..to)

  job = "受付"
  second_job = "自習室"

  Shift.create!(duty_on: date,
                started_at: start_time,
                end_at: end_time,
                job: job,
                status: 1
               )

  Shift.create!(duty_on: date,
                started_at: start_time,
                end_at: end_time,
                job: second_job,
                status: 1
              　)
end
