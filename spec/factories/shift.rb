FactoryBot.define do

  factory :shift do
    id {1}
    duty_on { Date.today+1 }
    started_at { DateTime.new(2019, 11 ,11, 10, 30, 45, 0.375) }
    end_at { DateTime.new(2019, 11 ,11, 17, 00, 45, 0.375) }
    job { "自習室" }
    status {"released"}
  end

  factory :second_shift, class: Shift do
    id {2}
    duty_on { Date.today+2 }
    started_at { DateTime.new(2019, 11 ,20, 12, 00,45, 0.375) }
    end_at { DateTime.new(2019, 11 ,20, 20, 00, 45, 0.375) }
    job { "受付" }
    status {"nonreleased"}
  end

  factory :third_shift, class: Shift do
    id {3}
    duty_on { Date.today+3 }
    started_at { DateTime.new(2019, 11 ,30, 15, 00) }
    end_at { DateTime.new(2019, 11 ,30, 22, 00) }
    job { "受付" }
  end
end
