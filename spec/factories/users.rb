FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abcd1234'}
    password_confirmation {'password'}
    last_name             {'確認'}
    first_name            {'太郎'}
    last_name_kana        {'カクニン'}
    first_name_kana       {'タロウ'}
    birthday              {'2000-01-01'}
  end
end