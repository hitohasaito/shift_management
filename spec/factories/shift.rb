FactoryBot.define do

  factory :shift do
    id {1}
    duty_on { Time.zone.local(2019, 10, 10)   }
    started_at { DateTime.new(2019, 10 ,10, 10, 30, 45, 0.375) }
    end_at { DateTime.new(2019, 10 ,10, 17, 00, 45, 0.375) }
    job { "自習室" }
    status {"released"}
  end

  factory :second_shift, class: Shift do
    id {2}
    duty_on { Time.zone.local(2019, 10, 20) }
    started_at { DateTime.new(2019, 10 ,20, 12, 00,45, 0.375) }
    end_at { DateTime.new(2019, 10 ,20, 20, 00, 45, 0.375) }
    job { "受付" }
    status {"nonreleased"}
  end

  factory :third_shift, class: Shift do
    id {3}
    duty_on { Time.zone.local(2019, 10, 30) }
    started_at { DateTime.new(2019, 10 ,30, 15, 00) }
    end_at { DateTime.new(2019, 10 ,30, 22, 00) }
    job { "受付" }
  end
end

#
# Time.local(2019, 10, 10, 9, 33, 45, 0)
# Time.local(2017, 5, 1, 9, 33, 45, 0)
#  DateTime.new(2007, 5 ,30, 16, 20)
