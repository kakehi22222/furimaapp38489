FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { japanese_user.first }
    last_name             { japanese_user.last }
    first_name_kana       { japanese_user.first.katakana }
    last_name_kana        { japanese_user.last.katakana }
    birth_date            { '2000-01-01' }
  end
end
