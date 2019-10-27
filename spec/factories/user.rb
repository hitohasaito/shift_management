FactoryBot.define do

  factory :user do
    id { 1 }
    name { "name1" }
    email { "name1@email.com"}
    number{"11111111111"}
    password { "password1" }
    admin {"true"}
  end

  factory :second_user, class:User do
    id { 2 }
    name { "name2" }
    email { "name2@email.com"}
    number{"22222222222"}
    password { "password2" }
    admin {"false"}
  end

  factory :third_user, class:User do
    id { 3 }
    name { "name33" }
    email { "name33@email.com"}
    number{"33333333333"}
    password { "password3" }
    admin {"false"}
  end
end
