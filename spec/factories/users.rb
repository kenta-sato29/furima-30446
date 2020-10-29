FactoryBot.define do
  factory :user do
    nickname              { 'taro' }
    email                 { 'kkk@gmail.com' }
    password              { 'aaa00000' }
    password_confirmation { 'aaa00000' }
    family_name           { '田中' }
    family_name_kana      { 'タナカ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
