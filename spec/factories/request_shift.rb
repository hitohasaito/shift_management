FactoryBot.define do

  factory :request_shift do
    worked_on { Time.zone.local(2019, 10, 10)   }
    start_work_at { DateTime.new(2019, 10 ,10, 10, 00, 45, 0.375) }
    end_work_at { DateTime.new(2019, 10 ,10, 15, 00, 45, 0.375) }
    work_job { "自習室" }
  end
end
