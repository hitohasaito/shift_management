FactoryBot.define do

  factory :shift do
    duty_on { Time.zone.local(2019, 10, 10)   }
    started_at { DateTime.new(2019, 10 ,10, 10, 00) }
    end_at { DateTime.new(2019, 10 ,10, 17, 00) }
    job { "自習室" }
    assigned_user { "田中" }
  end

  factory :second_shift, class: Shift do
    duty_on { Time.zone.local(2019, 10, 20) }
    started_at { DateTime.new(2019, 10 ,20, 12, 00) }
    end_at { DateTime.new(2019, 10 ,20, 20, 00) }
    job { "受付" }
    assigned_user { "佐藤" }
  end

  factory :third_shift, class: Shift do
    duty_on { Time.zone.local(2019, 10, 30) }
    started_at { DateTime.new(2019, 10 ,30, 15, 00) }
    end_at { DateTime.new(2019, 10 ,30, 22, 00) }
    job { "受付" }
     assigned_user { "鈴木" }
  end
end
