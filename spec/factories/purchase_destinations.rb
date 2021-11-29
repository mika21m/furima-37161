FactoryBot.define do
  factory :purchase_destination do
    postal_code { '123-4567' }
    prefecture_id { 24 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '0901234567' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
