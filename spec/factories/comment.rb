FactoryBot.define do

  factory :comment do
    content {"コメントします"}
    user_id {1}
    shift_id {1}
  end
end
