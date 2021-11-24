FactoryBot.define do
  factory :item do
    name { 'test' }
    description {Faker::Lorem.sentence}
    category_id { 5 }
    status_id { 2 }
    shipping_cost_id { 2 }
    shipping_prefecture_id { 23 }
    shipping_day_id { 2 }
    price { '5000' }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
