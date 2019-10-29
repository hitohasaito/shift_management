FactoryBot.define do

  factory :request_shift do
    id {1}
    worked_on { Date.today+1 }
    start_work_at { DateTime.new(2019, 10 ,10, 10, 00, 45, 0.375) }
    end_work_at { DateTime.new(2019, 10 ,10, 19, 00, 45, 0.375) }
    work_job { "自習室" }
  end

  factory :second_request_shift, class:RequestShift do
    id {2}
    worked_on { Date.today+2 }
    start_work_at { DateTime.new(2019, 10 ,10, 18, 00, 45, 0.375) }
    end_work_at { DateTime.new(2019, 10 ,10, 22, 00, 45, 0.375) }
    work_job { "自習室" }
  end
end
