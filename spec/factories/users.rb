FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = "1a"+Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    family_name           {"ホゲ"} 
    last_name             {"ホエ"}
    family_name_kana      {"ホゲ"} 
    last_name_kana        {"ホエ"}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end