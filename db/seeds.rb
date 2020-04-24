# 1.times do |n|
#   name = "admin"
#   email = "admin@email.com"
#   password = "password"
#   number = "08011111111"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                number: number,
#                admin: "true"
#                )
# end

# 10.times do |n|
#   User.create!(name: "user#{n}",
#                email: "user#{n}@email.com",
#                password: "password#{n}",
#                number: 12345678976,
#                admin: "false"
#                )
# end

30.times do |n|

  from = Date.today
  to = Date.today+30
  date = Random.rand(from..to)

  from = Time.parse("9:00")
  to = Time.parse("13:00")
  start_time = Random.rand(from..to)

  from = Time.parse("13:30")
  to = Time.parse("22:00")
  end_time = Random.rand(from..to)

  job = "受付"
  second_job = "自習室"

  Shift.create!(duty_on: date,
                started_at: start_time,
                end_at: end_time,
                job: job,
                status: 1
               )
end
