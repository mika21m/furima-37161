FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {'password'}
    last_name             {'確認'}
    first_name            {'太郎'}
    last_name_kana        {'カクニン'}
    first_name_kana       {'タロウ'}
    birthday              {'2000-01-01'}
  end
end