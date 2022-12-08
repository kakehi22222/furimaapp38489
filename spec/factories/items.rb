FactoryBot.define do
  factory :item do
    item_name { 'パジェロ' }
    item_info { '高級車' }
    item_price { 300_000 }
    category_id { 5 }
    condition_id { 3 }
    cost_burden_id { 2 }
    prefectures_id { 40 }
    aim_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
