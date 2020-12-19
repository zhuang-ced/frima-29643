FactoryBot.define do
  factory :user do
    nickname              {"ああああ"}
    email                 {"aaa@aaa"}
    password              {"111111"}
    password_confirmation {password}
    last_name             {"あああ"}
    first_name            {"いいい"}
    lastname_kana         {"アアア"}
    firstname_kana        {"イイイ"}
  end
end
