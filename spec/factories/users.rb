FactoryBot.define do
  factory :user do
    nickname              { 'ああああ' }
    email                 { 'aaa@aaa' }
    password              { 'a1b1c1' }
    password_confirmation { password }
    last_name             { 'あああ' }
    first_name            { 'いいい' }
    lastname_kana         { 'アアア' }
    firstname_kana        { 'イイイ' }
    birthday              { '2000-01-10' }
  end
end
