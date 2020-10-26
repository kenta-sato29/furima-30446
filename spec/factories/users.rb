FactoryBot.define do
  factory :user do
    # nickname              {Faker::Name.initials(number: 2)}
    # email                 {Faker::Internet.free_email}
     password              {'1a' + Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
    nickname              {"taro"}
    email                 {"kkk@gmail.com"}
    password              {"aaa00000"}
    password_confirmation {"aaa00000"} 
    family_name           {"田中"}
    family_name_kana      {"タナカ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birthday              {"2000-01-01"}
  end
end
